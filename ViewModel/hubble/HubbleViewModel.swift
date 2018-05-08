//
//  HubbleViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HubbleViewModel: BaseViewModel {
    override init() {
        super.init()
    }
    
    func tableViewHubbleTableViewCellSetData(indexPath:IndexPath, cell:HubbleTableViewCell) {
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
    }
    
}

extension HubbleViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
}

extension HubbleViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HubbleTableViewCell.description(), for: indexPath)
        self.tableViewHubbleTableViewCellSetData(indexPath: indexPath, cell: cell as! HubbleTableViewCell)
        cell.selectionStyle = .none
        return cell
    }
}
