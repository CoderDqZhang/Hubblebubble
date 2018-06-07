//
//  GoodsViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

typealias GoodlsListClouse = (_ category_list:NSMutableArray) ->Void

class GoodsViewModel: BaseViewModel {
    
    var page = 1
    var total_page:Int!
    var category:CategoryGoods!
    var model:GoodsModel!
    var banner_list:NSMutableArray!
    
    override init() {
        super.init()
        
    }
    
    func collectViewGoodsCollectionViewCellSetData(indexPath:IndexPath, cell:GoodsCollectionViewCell) {
        cell.cellSetData(model: model.itemList[indexPath.row])
    }
    
    func cellBanner(_ headerView: GoodHeaderCollectionViewCell){
        if self.model != nil {
            headerView.cellSetData(model: self.model)
        }
    }
    
    func collectDidSelect(_ indexPath:IndexPath) {
        
    }
    
    func requestData(){
        let url = "\(ROOT_URL)\(GOODS_LIST_CATEGORY)"
        let parameters = ["page":self.page,"category_id":self.category.id]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted{
                if self.page == 1 {
                    self.total_page = (resultDic.value as! NSDictionary).object(forKey: "total_page") as! Int
                    self.model = GoodsModel.init(fromDictionary: resultDic.value as! NSDictionary)
                    (self.controller as! GoodsViewController).collectView.reloadData()
                    if (self.controller as! GoodsViewController).collectView.mj_header != nil {
                        (self.controller as! GoodsViewController).collectView.mj_header.endRefreshing()
                    }
                }else{
                    self.model.itemList.append(contentsOf: GoodsModel.init(fromDictionary: resultDic.value as! NSDictionary).itemList)
                    if (self.controller as! GoodsViewController).collectView.mj_footer != nil {
                        (self.controller as! GoodsViewController).collectView.mj_footer.endRefreshing()
                    }
                }
                
            }
        }
    }
}

extension GoodsViewModel : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectDidSelect(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == "UICollectionElementKindSectionHeader" {
            let kindView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GoodHeaderCollectionViewCell.description(), for: indexPath)
            let height:CGFloat = (IPHONEWIDTH320 ? 137 : IPHONEWIDTH375 ? 160 : 180) + 8
            kindView.frame = CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: height)
            self.cellBanner(kindView as! GoodHeaderCollectionViewCell)
            return kindView
        }else{
            let kindView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GoodFooterCollectionViewCell.description(), for: indexPath)
            kindView.frame = CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: 0)
            kindView.backgroundColor = UIColor.red
            return kindView
        }
    }
}

extension GoodsViewModel : UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model == nil ? 0 : self.model.itemList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: GoodsCollectionViewCell.description(), for: indexPath)
        self.collectViewGoodsCollectionViewCellSetData(indexPath: indexPath, cell: collectViewCell as! GoodsCollectionViewCell)
        return collectViewCell
    }
}

extension GoodsViewModel : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize.init(width: (SCREENWIDTH - 14) / 2, height: ((SCREENWIDTH - 14) / 2) * 95 / 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        let height:CGFloat = (IPHONEWIDTH320 ? 137 : IPHONEWIDTH375 ? 160 : 180) + 18
        return CGSize.init(width: SCREENWIDTH, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: 0.001, height: 0.001)
    }
}

extension HomeViewModel : UIViewControllerTransitioningDelegate {
    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return (PresentTransitionAnimated.init() as! UIViewControllerAnimatedTransitioning)
//    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return nil
    }
}
