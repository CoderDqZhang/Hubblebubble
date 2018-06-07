//
//  ArticleViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticleViewController: BaseViewController {

    var articleViewModel = ArticleViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: articleViewModel, controller: self)
        self.setUpTableView(style: .plain, cells: [ArticleCategoryTableViewCell.self,ArticleHeaderTableViewCell.self], controller: self)
        self.updateTableView()
        self.setUpRefreshData {
            self.articleViewModel.page = 1
            self.articleViewModel.requestData()
        }
        self.setUpLoadMoreData(refresh: {
            if self.articleViewModel.page == self.articleViewModel.total_page {
                self.stopLoadMoreData()
                return
            }
            self.articleViewModel.page = self.articleViewModel.page + 1
            self.articleViewModel.requestData()
        })
        // Do any additional setup after loading the view.
    }
    
    func updateTableView() {
        self.tableView.snp.updateConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(IPHONEX ? -24:0)
        }
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
