//
//  DetailViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class DetailViewModel: BaseViewModel {
    override init() {
        super.init()
    }
    
    func tableViewCommondTableViewCellSetData(_ indexPath:IndexPath, cell:CommondTableViewCell) {
        cell.setData(username: "昵称", image: UIImage.init(named: "2.jpg")!, content: "他将成为仅次于马化腾、马云、李嘉诚的中国第四大富豪，几位联合创始人的身家也将普遍超过10亿美元（约合人民币63亿元），可能有上千名员工成为千万富翁。")
    }
    
    func tableViewArticelDescTableViewCellSetData(_ indexPath:IndexPath, cell:ArticelDescTableViewCell) {
        cell.setData(title: "小米造富神话虚实:平均年薪16万 470亿元期权咋分", desc: "如果能实现1000亿市值的目标，那么仅算小米公司持股，小米集团创始人、董事会主席兼首席执行官雷军的财富就将达到314亿美元（约合人民币1992亿元），他将成为仅次于马化腾、马云、李嘉诚的中国第四大富豪，几位联合创始人的身家也将普遍超过10亿美元（约合人民币63亿元），可能有上千名员工成为千万富翁。\n\n小米离职员工高磊（化名）告诉澎湃新闻（www.thepaper.cn）记者，2012年初前入职的工号1000以内且仍然在职的部分小米员工，才可能财富自由，“一些超级大股东可能每个人持有几百万份小米股票。\n\n对更多的普通员工来说，能否熬过公司早年的创业期，抵御随后的行权诱惑，都是问题。", authon: "网易新闻", date: "05-1108:42", image: UIImage.init(named: "1.jpg")!, red: "阅读量：10000")
    }
    
    func tableViewDidSelect(_ indexPath:IndexPath) {
        
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
        return 5
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
