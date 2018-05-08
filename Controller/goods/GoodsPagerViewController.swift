//
//  GoodsPagerViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class GoodsPagerViewController: TYTabButtonPagerController {

    var index:Int = 0
    var pageTitle = ["热门","美鞋","上衣","热裤","裙子","短袖","袜子"]
    var controllers = [GoodsViewController(),GoodsViewController(),GoodsViewController(),GoodsViewController(),GoodsViewController(),GoodsViewController(),GoodsViewController(),]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "美文"
        self.setUpNavigationItem()
        self.setUpPageViewControllerStyle()
        self.setUpView()
        self.bindViewModel()
        // Do any additional setup after loading the view.
    }
    
    func setUpPageViewControllerStyle(){
        self.collectionLayoutEdging = 10
        self.pagerBarColor = UIColor.init(hexString: App_Theme_6D4033_Color)
        self.cellSpacing = 10
        self.cellEdging = 10
        self.progressHeight = 2
        self.progressEdging = 0
        self.contentTopEdging = 40
        self.normalTextFont = App_Theme_PinFan_R_13_Font
        self.selectedTextFont = App_Theme_PinFan_R_13_Font
        self.normalTextColor = UIColor.init(hexString: App_Theme_333333_Color)
        self.selectedTextColor = UIColor.init(hexString: App_Theme_FA4B95_Color)
        self.selectedTextFont = App_Theme_PinFan_R_13_Font
    }
    
    func setUpView(){
        let lineView = GloabLineView(frame: CGRect.init(x: 0, y: 40, width: SCREENWIDTH, height: 0.5))
        self.view.addSubview(lineView)
    }
    
    func bindViewModel(){
        //        viewModel.requestCategotyDic(self,index:index)
    }
    
    func setUpNavigationItem() {
        self.setNavigationItemBack()
        //        let filtterItem = UIBarButtonItem(image: UIImage.init(named: "Icon_Filter_Normal")?.imageWithRenderingMode(.AlwaysOriginal), landscapeImagePhone: nil, style: .Plain, target: self, action: #selector(TicketPageViewController.filterPress(_:)))
        //        let searchItem = UIBarButtonItem(image: UIImage.init(named: "Icon_Search_Normal")?.imageWithRenderingMode(.AlwaysOriginal), landscapeImagePhone: nil, style: .Plain, target: self, action: #selector(TicketPageViewController.searchPress(_:)))
        //        self.navigationItem.rightBarButtonItem = searchItem
    }
    
    func pageViewControllerDidSelectIndexPath(index:Int) {
        self.index = index
    }
    
    func filterPress(sender:UIBarButtonItem) {
        
    }
    
    func searchPress(sender:UIBarButtonItem) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func setBarStyle(_ barStyle: TYPagerBarStyle) {
        super.setBarStyle(barStyle)
    }
    
    // MARK: - TYTabButtonDelegate
    override func pagerController(_ pagerController: TYPagerController!, titleFor index: Int) -> String! {
        return pageTitle[index]
    }
    
    // MARK: - TYTabButtonDataSource
    override func numberOfControllersInPagerController() -> Int {
        return pageTitle.count
    }
    
    override func pagerController(_ pagerController: TYPagerController!, transitionFrom fromIndex: Int, to toIndex: Int, animated: Bool) {
        
    }
    
    override func pagerController(_ pagerController: TYPagerController!, numberFor index: Int) -> String! {
        return "0"
    }
    
    
    override func pagerController(_ pagerController: TYPagerController!, controllerFor index: Int) -> UIViewController! {
        return controllers[index]
    }
}
