//
//  RedViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class RedViewModel: BaseViewModel {
    override init() {
        super.init()
    }
    
    func tableViewRedManagerTableViewCellSetData(_ indexPath:IndexPath, cell:RedManagerTableViewCell) {
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
    
}

extension RedViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 103.5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

extension RedViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FansTableViewCell.description(), for: indexPath)
        self.tableViewRedManagerTableViewCellSetData(indexPath: indexPath, cell: cell as! RedManagerTableViewCell)
        cell.selectionStyle = .none
        return cell
    }
}

