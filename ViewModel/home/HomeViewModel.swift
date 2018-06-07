//
//  HomeViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {
    
    var mood_list:NSMutableArray! = NSMutableArray.init()
    var page:NSInteger = 1
    var total_page:Int!
    
    override init() {
        super.init()
        self.requestHomeData()
    }
    
    func tableViewReCommendTableViewCellSetData(indexPath:IndexPath, cell:ReCommendTableViewCell) {
        cell.cellSetData(Recommod.init(fromDictionary: self.mood_list[indexPath.row] as! NSDictionary))
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
//        KWINDOWDS().addSubview(GloableNotificationView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT), type: .Notification, title: "活动通知", subTitle: "Codeless drop-in universal library allows to prevent issues of keyboard slidiupand cover UITextField/UITextView. Neither need to write any code nor any setup requiredand much more.", buttonTitle: "立即前往", gloableNotificationViewButtonClouse: {
//
//        }))
        let detailInfo = DetailArticleViewController()
        detailInfo.detailViewModel.article = Recommod.init(fromDictionary: self.mood_list[indexPath.row] as! NSDictionary)
        NavigationPushView(self.controller!, toConroller: detailInfo)
    }
    
    func requestHomeData(){
        let url = "\(ROOT_URL)\(ARTICLE_LIST_RECOMMENT)"
        var parameters:AnyObject? = nil
        if UserInfoModel.isLoggedIn() {
            parameters = ["user_id":UserInfoModel.shareInstance.user_id,"page":self.page] as AnyObject
        }
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted {
                if self.page == 1 {
                    self.total_page = (resultDic.value! as! NSDictionary).object(forKey: "total_page") as! Int
                    self.mood_list = NSMutableArray.init(array: (resultDic.value! as! NSDictionary).object(forKey: "article_list") as! NSMutableArray)
                    if self.controller?.tableView.mj_header != nil {
                        self.controller?.stopRefresh()
                    }
                }else{
                    let tempArray = NSMutableArray.init(array: (resultDic.value! as! NSDictionary).object(forKey: "article_list") as! NSMutableArray)
                    self.mood_list.addObjects(from: tempArray as! [Any])
                    if self.controller?.tableView.mj_header != nil {
                        self.controller?.stopLoadMoreData()
                    }
                }
                self.controller?.tableView.reloadData()
            }
        }
    }
    
}

extension HomeViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

extension HomeViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mood_list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReCommendTableViewCell.description(), for: indexPath)
        self.tableViewReCommendTableViewCellSetData(indexPath: indexPath, cell: cell as! ReCommendTableViewCell)
        cell.selectionStyle = .none
        return cell
    }
}

