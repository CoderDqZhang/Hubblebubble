//
//  HomeViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var homeViewModel:BaseViewModel! = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: homeViewModel, controller: self)
        self.setUpTableView(style: .plain, cells: [ReCommendTableViewCell.self], controller: self)
        self.navigationItem.title = "心情推荐"
        
        self.setUpRefreshData {
            (self.homeViewModel as! HomeViewModel).page = 1
            (self.homeViewModel as! HomeViewModel).requestHomeData()
        }
        self.setUpLoadMoreData {
            if (self.homeViewModel as! HomeViewModel).page == (self.homeViewModel as! HomeViewModel).total_page {
                self.stopLoadMoreData()
                return
            }
            (self.homeViewModel as! HomeViewModel).page = (self.homeViewModel as! HomeViewModel).page + 1
            (self.homeViewModel as! HomeViewModel).requestHomeData()
        }
//       self.navigationController?.navigationBar.isTranslucent = true
        // Do any additional setup after loading the view.
    }
    
    override func viewControllerSetNavigationItemBack() {
        
    }
    
    override func setUpViewNavigationItem() {
        self.navigationItem.title = "心情推荐"
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
