//
//  FansViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class FansViewModel: BaseViewModel {
    override init() {
        super.init()
    }
    
    func tableViewFansTableViewCellSetData(_ indexPath:IndexPath, cell:FansTableViewCell) {
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
    
}

extension FansViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

extension FansViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FansTableViewCell.description(), for: indexPath)
        self.tableViewFansTableViewCellSetData(indexPath, cell: cell as! FansTableViewCell)
        cell.selectionStyle = .none
        return cell
    }
}
