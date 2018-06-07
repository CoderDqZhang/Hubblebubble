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
    let goodsView = GoodsPagerViewController()
    let mineView = MineViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeNav = self.createNavigationItem(viewController: homeView, title: "推荐", image: UIImage.init(named: "推荐")!, selectImage: UIImage.init(named: "多边形1")!)
        let hubbleNav = UINavigationController.init(rootViewController: hubbleView)
        hubbleNav.tabBarItem.title = "气泡"
        hubbleNav.tabBarItem.image = UIImage.init(named: "组19")!
        hubbleNav.tabBarItem.selectedImage = UIImage.init(named: "组19")!.original
        
        let articleNav = UINavigationController.init(rootViewController: articleView)
        articleNav.tabBarItem.title = "美文"
        articleNav.tabBarItem.image = UIImage.init(named: "文章-1")!
        articleNav.tabBarItem.selectedImage = UIImage.init(named: "组25")!.original
        
        let goodsNav = UINavigationController.init(rootViewController: goodsView)
        goodsNav.tabBarItem.title = "美物"
        goodsNav.tabBarItem.image = UIImage.init(named: "组20")!
        goodsNav.tabBarItem.selectedImage = UIImage.init(named: "圆角矩形6")!.original
        
        let mineNav = self.createNavigationItem(viewController: mineView, title: "我的", image: UIImage.init(named: "个人中心")!, selectImage: UIImage.init(named: "椭圆8"))
        
        self.viewControllers = [homeNav,hubbleNav,articleNav,goodsNav,mineNav]
        
        // Do any additional setup after loading the view.
    }
    
    
    func createNavigationItem(viewController:BaseViewController, title:String, image:UIImage, selectImage:UIImage?) ->UINavigationController{
        let navigationController = UINavigationController.init(rootViewController: viewController)
        viewController.tabBarItem.title = title
        viewController.navigationItem.title = title
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = selectImage?.original
        
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
