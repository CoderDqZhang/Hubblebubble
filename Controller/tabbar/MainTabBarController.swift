//
//  MainTabBarController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let homeView = HomeViewController()
    let hubbleView = HubblePageViewController()
    let articleView = ArticleViewController()
    let goodsView = GoodsViewController()
    let mineView = MineViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeNav = self.createNavigationItem(viewController: homeView, title: "推荐", image: UIImage.init(named: "推荐")!)
        let hubbleNav = UINavigationController.init(rootViewController: hubbleView)
        hubbleNav.tabBarItem.title = "气泡"
        hubbleNav.tabBarItem.image = UIImage.init(named: "气泡")!
//        let hubbleNav = self.createNavigationItem(viewController: hubbleView, title: "气泡", image: UIImage.init(named: "气泡")!)
        let articleNav = self.createNavigationItem(viewController: articleView, title: "美文", image: UIImage.init(named: "文章")!)
        let goodsNav = self.createNavigationItem(viewController: goodsView, title: "美物", image: UIImage.init(named: "产品")!)
        let mineNav = self.createNavigationItem(viewController: mineView, title: "我的", image: UIImage.init(named: "个人中心")!)
        
        self.viewControllers = [homeNav,hubbleNav,articleNav,goodsNav,mineNav]
        // Do any additional setup after loading the view.
    }
    
    
    func createNavigationItem(viewController:BaseViewController, title:String, image:UIImage) ->UINavigationController{
        let navigationController = UINavigationController.init(rootViewController: viewController)
        viewController.tabBarItem.title = title
        viewController.navigationItem.title = title
        viewController.tabBarItem.image = image
        return navigationController
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
