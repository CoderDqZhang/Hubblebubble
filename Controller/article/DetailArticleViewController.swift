//
//  DetailArticleViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class DetailArticleViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: DetailViewModel(), controller: self)
        self.setUpTableView(style: .plain, cells: [ArticelDescTableViewCell.self,CommondTableViewCell.self,CommondDescTableViewCell.self], controller: self)
        // Do any additional setup after loading the view.
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
