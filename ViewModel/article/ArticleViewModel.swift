//
//  ArticleViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticleViewModel: BaseViewModel {
    override init() {
        super.init()
    }
    
    func tableViewReCommendTableViewCellSetData(indexPath:IndexPath, cell:ReCommendTableViewCell) {
        
    }
    
    func tableViewArticleHeaderTableViewCellSetData(_ indexPath:IndexPath, cell:ArticleHeaderTableViewCell) {
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        NavigationPushView(self.controller!, toConroller: DetailArticleViewController())
    }
    
}

extension ArticleViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 140
        }
        return 80
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleHeaderTableViewCell.description(), for: indexPath)
            self.tableViewArticleHeaderTableViewCellSetData(indexPath, cell: cell as! ArticleHeaderTableViewCell)
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ReCommendTableViewCell.description(), for: indexPath)
            self.tableViewReCommendTableViewCellSetData(indexPath: indexPath, cell: cell as! ReCommendTableViewCell)
            cell.selectionStyle = .none
            return cell
        }
    }
}
