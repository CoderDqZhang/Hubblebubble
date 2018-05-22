//
//  HomeViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {
    
    override init() {
        super.init()
    }
    
    func tableViewReCommendTableViewCellSetData(indexPath:IndexPath, cell:ReCommendTableViewCell) {
        
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        KWINDOWDS().addSubview(GloableNotificationView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT), type: .Notification, title: "活动通知", subTitle: "Codeless drop-in universal library allows to prevent issues of keyboard slidiupand cover UITextField/UITextView. Neither need to write any code nor any setup requiredand much more.", buttonTitle: "立即前往", gloableNotificationViewButtonClouse: {
            
        }))
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReCommendTableViewCell.description(), for: indexPath)
        self.tableViewReCommendTableViewCellSetData(indexPath: indexPath, cell: cell as! ReCommendTableViewCell)
        cell.selectionStyle = .none
        return cell
    }
}

