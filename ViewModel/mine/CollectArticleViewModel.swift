//
//  CollectArticleViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class CollectArticleViewModel: BaseViewModel {
    
    var page = 1
    var total_page:Int!
    var mood_list = NSMutableArray.init()
    override init() {
        super.init()
        self.requestCollectArticle()
    }
    
    func tableViewHistoryArticleTableViewCellSetData(_ indexPath:IndexPath, cell:HistoryArticleTableViewCell) {
        cell.cellSetData(Recommod.init(fromDictionary: self.mood_list[indexPath.section] as! NSDictionary))
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        let detailInfo = DetailArticleViewController()
        detailInfo.detailViewModel.article = Recommod.init(fromDictionary: self.mood_list[indexPath.section] as! NSDictionary)
        NavigationPushView(self.controller!, toConroller: detailInfo)
    }
    
    func requestCollectArticle(){
        let url = "\(ROOT_URL)\(ARTICLE_LIST_COLLECT)"
        let parameters = ["user_id":UserInfoModel.shareInstance.user_id, "page":self.page] as [String : Any]
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

extension CollectArticleViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 110
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

extension CollectArticleViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mood_list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryArticleTableViewCell.description(), for: indexPath)
        self.tableViewHistoryArticleTableViewCellSetData(indexPath, cell: cell as! HistoryArticleTableViewCell)
        cell.selectionStyle = .none
        return cell
    }
}
