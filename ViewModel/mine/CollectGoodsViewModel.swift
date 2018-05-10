
//
//  CollectGoodsViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class CollectGoodsViewModel: BaseViewModel {

    override init() {
        super.init()
    }
    
    func tableViewHistoryArticleTableViewCellSetData(_ indexPath:IndexPath, cell:HistoryArticleTableViewCell) {
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
    
}

extension CollectGoodsViewModel: UITableViewDelegate {
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

extension CollectGoodsViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
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
