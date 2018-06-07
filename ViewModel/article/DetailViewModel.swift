//
//  DetailViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class DetailViewModel: BaseViewModel {
    
    var article:Recommod!
    var articleInfo:ArticleInfo!
    var comments:NSMutableArray = NSMutableArray.init()
    var page:Int = 1
    var total_page:Int!
    var detailModel:ArticleDetailModel!
    
    override init() {
        super.init()
    }
    
    func tableViewCommondTableViewCellSetData(_ indexPath:IndexPath, cell:CommondTableViewCell) {
//        cell.setData(username: "昵称", image: UIImage.init(named: "2.jpg")!, content: "他将成为仅次于马化腾、马云、李嘉诚的中国第四大富豪，几位联合创始人的身家也将普遍超过10亿美元（约合人民币63亿元），可能有上千名员工成为千万富翁。")
    }
    
    func tableViewArticelDescTableViewCellSetData(_ indexPath:IndexPath, cell:ArticelDescTableViewCell) {
        if self.detailModel != nil {
            cell.cellsetData(model: self.detailModel)
        }
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
    
    func requestData(){
        let url = "\(ROOT_URL)\(ARTICLE_INFO)"
        let parameters = ["article_id":article.id]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted{
                self.detailModel = ArticleDetailModel.init(fromDictionary: (resultDic.value as! NSDictionary))
                self.controller?.tableView.reloadData()
            }
        }
    }
    
    func requestCommondData(){
        let url = "\(ROOT_URL)\(ARTICLE_COMMENTS)"
        let parameters = ["article_id":article.id,"page":self.page] as [String : Any]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted{
                if self.page == 1 {
                    self.total_page = (resultDic.value! as! NSDictionary).object(forKey: "total_page") as! Int
                    self.comments.removeAllObjects()
                    self.comments = NSMutableArray.init(array: (resultDic.value as! NSDictionary).object(forKey: "article_list") as! [Any])
                    if self.controller?.tableView.mj_header != nil {
                        self.controller?.stopRefresh()
                    }
                }else{
                    self.comments.addObjects(from:NSMutableArray.init(array: (resultDic.value as! NSDictionary).object(forKey: "article_list") as! [Any]) as! [Any])
                    if self.controller?.tableView.mj_footer != nil {
                        self.controller?.stopLoadMoreData()
                    }
                }
                self.controller?.tableView.reloadData()
            }
        }
    }
    
    func requestCommonds(str:String?){
        let url = "\(ROOT_URL)\(ADD_ARTICLE_COMMENTS)"
        var parameters:AnyObject?
        if !UserInfoModel.isLoggedIn() {
            parameters = ["user_id":UserInfoModel.shareInstance.user_id,"article_id":self.detailModel.articleInfo.id,"content":str] as AnyObject
        }else{
            parameters = ["article_id":self.detailModel.articleInfo.id,"content":str] as AnyObject
        }
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            
        }
    }
    
    func requestArticleStatus(type:BottomViewType){
        var url = ""
        if type == .parase {
            url = "\(ROOT_URL)\(ARTICLE_ADD_LIKE)"
        }else if type == .collect {
            url = "\(ROOT_URL)\(ARTICLE_ADD_COLLECT)"
        }else{
            let model = ShareModel.init()
            model.title = "dd"
            model.desc = "ddd"
            model.imageUrl = "ddd"
            model.url = "ddd"
            KWINDOWDS().addSubview(ShareView.init(title: "title", model: model, image: nil, url: nil))
            return
        }
        if !UserInfoModel.isLoggedIn() {
            self.controller?.navigationController?.pushViewController(LoginViewController())
            return
        }
        let parameters = ["user_id":UserInfoModel.shareInstance.user_id,"article_id":self.detailModel.articleInfo.id,"action":"add"]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            
        }
    }
}

extension DetailViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return tableView.fd_heightForCell(withIdentifier: ArticelDescTableViewCell.description(), configuration: { (cell) in
                self.tableViewArticelDescTableViewCellSetData(indexPath, cell: cell as! ArticelDescTableViewCell)
            })
        }else if indexPath.row == 1 {
            return 50
        }
        return tableView.fd_heightForCell(withIdentifier: CommondTableViewCell.description(), configuration: { (cell) in
            self.tableViewCommondTableViewCellSetData(indexPath, cell: cell as! CommondTableViewCell)
        })
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

extension DetailViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticelDescTableViewCell.description(), for: indexPath)
            self.tableViewArticelDescTableViewCellSetData(indexPath, cell: cell as! ArticelDescTableViewCell)
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommondDescTableViewCell.description(), for: indexPath)
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CommondTableViewCell.description(), for: indexPath)
            self.tableViewCommondTableViewCellSetData(indexPath, cell: cell as! CommondTableViewCell)
            cell.selectionStyle = .none
            return cell
        }
    }
}
