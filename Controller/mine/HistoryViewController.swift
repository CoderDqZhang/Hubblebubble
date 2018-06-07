//
//  HistoryViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HistoryViewController: BaseViewController {

    var historyArtcleViewModel = HistoryArtcleViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bindViewModel(viewModel: historyArtcleViewModel, controller: self)
        self.setUpTableView(style: .grouped, cells: [HistoryArticleTableViewCell.self], controller: self)
        
        self.setUpRefreshData {
            self.historyArtcleViewModel.page = 1
            self.historyArtcleViewModel.requestHistory()
        }
        self.setUpLoadMoreData {
            if self.historyArtcleViewModel.page == self.historyArtcleViewModel.total_page{
                self.stopLoadMoreData()
                return
            }else{
                self.historyArtcleViewModel.page = self.historyArtcleViewModel.page + 1
            }
            self.historyArtcleViewModel.requestHistory()
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.top.equalTo(self.view.snp.top).offset(149)
        }
        
        self.setNavigationTitle(title: "浏览记录")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
