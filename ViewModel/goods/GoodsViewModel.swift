//
//  GoodsViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class GoodsViewModel: BaseViewModel {
    override init() {
        super.init()
    }
    
    func collectViewGoodsCollectionViewCellSetData(indexPath:IndexPath, cell:GoodsCollectionViewCell) {
        
    }
    
    func tableViewArticleHeaderTableViewCellSetData(_ indexPath:IndexPath, cell:ArticleHeaderTableViewCell) {
        
    }
    
    func collectDidSelect(_ indexPath:IndexPath) {
        
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
//            self.cellBanner(headerView: kindView as! GoodHeaderCollectionViewCell)
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
        return 10
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
