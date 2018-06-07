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
    var pageTitle:[String] = []
    var category = NSMutableArray.init()
    var controllers:[BaseViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "美物"
        self.setUpNavigationItem()
        self.setUpPageViewControllerStyle()
        self.setUpView()
        self.bindViewModel()
        self.requestData()
        // Do any additional setup after loading the view.
    }
    
    func requestData(){
        let url = "\(ROOT_URL)\(GOODS_LIST_CATEGORY)"
        let parameters = ["page":1]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted{
                self.category = NSMutableArray.init(array: (resultDic.value as! NSDictionary).object(forKey: "category_list") as! [Any])
                for i in 0...self.category.count - 1 {
                    let model = CategoryGoods.init(fromDictionary: self.category[i] as! NSDictionary)
                    self.pageTitle.append(model.name)
                    let controller = GoodsViewController()
                    if i == 0 {
                        controller.goodViewModel.model = GoodsModel.init(fromDictionary: resultDic.value as! NSDictionary)
                    }else{
                        controller.goodViewModel.model = nil
                    }
                    controller.goodViewModel.category = model
                    self.controllers.append(controller)
                }
                self.reloadData()
            }
        }
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
//        goodsViewModel.requestCategotyDic(self,index:index)
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
        (controllers[index] as! GoodsViewController).goodViewModel.requestData()
//        if (controllers[index] as! GoodsViewController).goodViewModel.model == nil && (controllers[index] as! GoodsViewController).goodViewModel.category != nil || (controllers[index] as! GoodsViewController).goodViewModel.model != nil && (controllers[index] as! GoodsViewController).goodViewModel.category != nil && (controllers[index] as! GoodsViewController).goodViewModel.model.itemList.count == 0 {
//            (controllers[index] as! GoodsViewController).goodViewModel.requestData()
//        }else{
//            (controllers[index] as! GoodsViewController).collectView.reloadData()
//        }
    }
    
    override func pagerController(_ pagerController: TYPagerController!, numberFor index: Int) -> String! {
        return "0"
    }
    
    
    override func pagerController(_ pagerController: TYPagerController!, controllerFor index: Int) -> UIViewController! {
        return controllers[index]
    }
}
