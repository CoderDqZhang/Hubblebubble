//
//  ArticleViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticleViewModel: BaseViewModel {
    
    var articleList:NSMutableArray! = NSMutableArray.init()
    var bannerList:NSMutableArray! = NSMutableArray.init()
    var page = 1
    var total_page:Int!
    override init() {
        super.init()
        self.requestData()
    }
    
    func tableViewArticleCategoryTableViewCellSetData(indexPath:IndexPath, cell:ArticleCategoryTableViewCell) {
        cell.cellSetData(Recommod.init(fromDictionary: self.articleList[indexPath.row - 1] as! NSDictionary))
    }
    
    func tableViewArticleHeaderTableViewCellSetData(_ indexPath:IndexPath, cell:ArticleHeaderTableViewCell) {
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        if indexPath.row > 0 {
            let detailInfo = DetailArticleViewController()
            detailInfo.detailViewModel.article = Recommod.init(fromDictionary: self.articleList[indexPath.row - 1] as! NSDictionary)
            NavigationPushView(self.controller!, toConroller: detailInfo)
        }
    }
    
    func requestData(){
        let url = "\(ROOT_URL)\(ARTICLE_LIST_CATEGORY)"
        let parameters = ["page":self.page]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted{
                if self.page == 1 {
                    self.total_page = (resultDic.value! as! NSDictionary).object(forKey: "total_page") as! Int
                    self.articleList.removeAllObjects()
                    self.articleList = NSMutableArray.init(array: (resultDic.value as! NSDictionary).object(forKey: "article_list") as! [Any])
                    if self.controller?.tableView.mj_header != nil {
                        self.controller?.stopRefresh()
                    }
                }else{
                    self.articleList.addObjects(from:NSMutableArray.init(array: (resultDic.value as! NSDictionary).object(forKey: "article_list") as! [Any]) as! [Any])
                    if self.controller?.tableView.mj_footer != nil {
                        self.controller?.stopLoadMoreData()
                    }
                }
                self.controller?.tableView.reloadData()
            }
        }
    }
}

extension ArticleViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        }
        return 160
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

extension ArticleViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleHeaderTableViewCell.description(), for: indexPath)
            self.tableViewArticleHeaderTableViewCellSetData(indexPath, cell: cell as! ArticleHeaderTableViewCell)
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCategoryTableViewCell.description(), for: indexPath)
            self.tableViewArticleCategoryTableViewCellSetData(indexPath: indexPath, cell: cell as! ArticleCategoryTableViewCell)
            cell.selectionStyle = .none
            return cell
        }
    }
}
