//
//  DetailArticleViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class DetailArticleViewController: BaseViewController {

    var detailViewModel = DetailViewModel()
    var bottomView:BottomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: detailViewModel, controller: self)
        self.setUpTableView(style: .plain, cells: [ArticelDescTableViewCell.self,CommondTableViewCell.self,CommondDescTableViewCell.self], controller: self)
        // Do any additional setup after loading the view.
        self.setUpRefreshData {
            self.detailViewModel.page = 1
            self.detailViewModel.requestCommondData()
        }
        self.setUpLoadMoreData(refresh: {
            if self.detailViewModel.page == self.detailViewModel.total_page {
                self.stopLoadMoreData()
                return
            }
            self.detailViewModel.page = self.detailViewModel.page + 1
            self.detailViewModel.requestCommondData()
        })
        self.updateTableView()
    }
    
    func updateTableView(){
        bottomView = BottomView.init(frame: CGRect.init(x: 0, y: SCREENHEIGHT - 40, width: SCREENWIDTH, height: 40), bottomViewClouse: { (type, str) in
            if str == nil {
                self.detailViewModel.requestArticleStatus(type: type)
            }else{
                self.detailViewModel.requestCommonds(str: str)
            }
        })
        self.view.addSubview(bottomView)
        self.tableView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-40)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.top.equalTo(self.view.snp.top).offset(0)
        }
    }
    
    override func setUpLogic() {
        self.detailViewModel.requestData()
        self.detailViewModel.requestCommondData()
    }
    
    override func setUpViewNavigationItem() {
        self.navigationItem.title = "文章详情"
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
