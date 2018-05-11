//
//  SettingViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit
import SDWebImage

class SettingViewModel: BaseViewModel {

    override init() {
        
    }
    
    func tableViewGloableTitleLabelTitleDescCellSetData(_ indexPath:IndexPath, cell:GloableTitleLabelTitleDescCell) {
        cell.cellSetData(title: "情况缓存", titleDescStr: "\(SDImageCache.shared().getSize())")
    }
    
    func tableViewGloableTitleLabelTitleDescCellSetData1(_ indexPath:IndexPath, cell:GloableTitleLabelTitleDescCell) {
        cell.cellSetData(title: "关于我们", titleDescStr: nil)
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath){
        switch indexPath.section {
        case 0:
            print("")
        default:
            NavigationPushView(self.controller!, toConroller: AboutViewController())
        }
    }
}

extension SettingViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.tableViewDidSelect(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension SettingViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableTitleLabelTitleDescCell.description(), for: indexPath)
            self.tableViewGloableTitleLabelTitleDescCellSetData(indexPath, cell: cell as! GloableTitleLabelTitleDescCell)
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloableTitleLabelTitleDescCell.description(), for: indexPath)
            self.tableViewGloableTitleLabelTitleDescCellSetData1(indexPath, cell: cell as! GloableTitleLabelTitleDescCell)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
    }
}
