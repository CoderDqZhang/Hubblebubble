//
//  CollectViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class CollectViewController: BaseViewController {

    var collectArticleViewModel = CollectArticleViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bindViewModel(viewModel: collectArticleViewModel, controller: self)
        self.setUpTableView(style: .grouped, cells: [HistoryArticleTableViewCell.self], controller: self)
//        self.updateTableView()
        self.setUpRefreshData {
            self.collectArticleViewModel.page = 1
            self.collectArticleViewModel.requestCollectArticle()
        }
        self.setUpLoadMoreData {
            if self.collectArticleViewModel.page == self.collectArticleViewModel.total_page{
                self.stopLoadMoreData()
                return
            }else{
                self.collectArticleViewModel.page = self.collectArticleViewModel.page + 1
            }
            self.collectArticleViewModel.requestCollectArticle()
        }
        
        self.tableView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.top.equalTo(self.view.snp.top).offset(149)
        }
        
        self.setNavigationTitle(title: "我的收藏")
        // Do any additional setup after loading the view.
    }
    
    
//    func updateTableView() {
//        self.tableView.snp.updateConstraints { (make) in
//            make.top.equalTo(self.view.snp.top).offset(IPHONEX ? -24:0)
//        }
//    }
    
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
