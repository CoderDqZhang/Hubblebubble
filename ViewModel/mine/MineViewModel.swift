//
//  MineViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class MineViewModel: BaseViewModel {

    var titles = [["我的红包"],["我的收藏","浏览记录"],["把泡椒推荐给朋友"],["帮助中心","意见反馈"],["设置"]]
    var images = [["我的红包"],["我的收藏","浏览记录"],["把泡椒推荐给朋友"],["帮助中心","意见反馈"],["设置"]]
    override init() {
        
    }
    
    func tableViewMineHeaderTableViewCellSetData(_ indexPath:IndexPath, cell:MineHeaderTableViewCell) {
        
    }
    
    func tableViewGloabImageTitleAndRightCellSetData(_ indexPath:IndexPath, cell:GloabImageTitleAndRightCell) {
        //images[indexPath.section - 1][indexPath.row]
        cell.setData(UIImage.init(named: "产品")!, titles[indexPath.section - 1][indexPath.row])
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath){
        switch indexPath.section {
        case 0:
            NavigationPushView(self.controller!, toConroller: LoginViewController())
        case 1:
            NavigationPushView(self.controller!, toConroller: RedViewController())
        case 2:
            if indexPath.row == 0{
                NavigationPushView(self.controller!, toConroller: ColloectPagerController())
            }else{
                NavigationPushView(self.controller!, toConroller: HistoryPagerController())
            }
        case 3:
            let model = ShareModel.init()
            model.title = "dd"
            model.desc = "ddd"
            model.imageUrl = "ddd"
            model.url = "ddd"
            KWINDOWDS().addSubview(ShareView.init(title: "title", model: model, image: nil, url: nil))
        case 4:
            if indexPath.row == 0 {
                NavigationPushView(self.controller!, toConroller: HelpViewController())
            }else{
                NavigationPushView(self.controller!, toConroller: FeedBackViewController())
            }
        default:
            NavigationPushView(self.controller!, toConroller: SettingViewController())
        }
    }
}

extension MineViewModel: UITableViewDelegate {
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
        if indexPath.section == 0 {
            return SCREENWIDTH * 417 / 750
        }
        return 50
    }
}

extension MineViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return titles[section - 1].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MineHeaderTableViewCell.description(), for: indexPath)
            self.tableViewMineHeaderTableViewCellSetData(indexPath, cell: cell as! MineHeaderTableViewCell)
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: GloabImageTitleAndRightCell.description(), for: indexPath)
            self.tableViewGloabImageTitleAndRightCellSetData(indexPath, cell: cell as! GloabImageTitleAndRightCell)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            return cell
        }
    }
}



