//
//  CollectViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class CollectViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.bindViewModel(viewModel: CollectArticleViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [HistoryArticleTableViewCell.self], controller: self)
        self.updateTableView()
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
