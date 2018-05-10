
//
//  BaseViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit
import SnapKit
import MJRefresh
import DZNEmptyDataSet
import FDFullscreenPopGesture

class BaseViewController: UIViewController {

    var tableView:UITableView!
    var viewModel:BaseViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.init(hexString: App_Theme_FAFAFA_Color)
        self.setUpView()
        self.viewControllerSetNavigationItemBack()
        self.setUpViewNavigationItem()
        self.setUpLogic()
        self.navigationController?.fd_fullscreenPopGestureRecognizer.isEnabled = true
        self.setupBaseViewForDismissKeyboard()
        self.navigationController?.navigationBar.layer.insertSublayer(ColorTools.changeColor(startColor: UIColor.init(hexString: App_Theme_9FC8FC_Color), endColor: UIColor.init(hexString: App_Theme_F4A0E7_Color), frame: CGRect.init(x: 0, y: -20, width: SCREENWIDTH, height: 64)), at: 0)
        // Do any additional setup after loading the view.
    }
    
    func setupBaseViewForDismissKeyboard(){
        self.setupForDismissKeyboard()
    }
    
    func setDZNEmptyData(){
        self.tableView.emptyDataSetDelegate = self.viewModel as! DZNEmptyDataSetDelegate
        self.tableView.emptyDataSetSource = self.viewModel as? DZNEmptyDataSetSource
    }
    
    func setDENEmptyCollectViewData(collectionView:UICollectionView, delegate:BaseViewModel?){
        collectionView.emptyDataSetDelegate = delegate
        collectionView.emptyDataSetSource = delegate as! DZNEmptyDataSetSource
    }
    
    func viewControllerSetNavigationItemBack(){
        self.setNavigationItemBack()
    }
    
    func setUpView(){
    }
    
    func setUpViewNavigationItem(){
    }
    
    func setUpLogic(){
    }
    
    func setNavigationTitle(title:String){
        self.navigationItem.title = title
    }
    
    func setUpTableView(style:UITableViewStyle, cells:[AnyClass], controller:UIViewController?){
        tableView = UITableView.init(frame: CGRect.zero, style: style)
        for cell in cells{
            tableView.register(cell.self, forCellReuseIdentifier: "\(cell.description())")
        }
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
            tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
            tableView.scrollIndicatorInsets = tableView.contentInset
        }
        self.tableView.contentInset.top = 0
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        self.tableView.separatorStyle = .none
        controller?.view.addSubview(tableView)
        tableView.delegate = viewModel as? UITableViewDelegate
        tableView.dataSource = viewModel as? UITableViewDataSource
        self.tableView.backgroundColor = UIColor.init(hexString: App_Theme_FAFAFA_Color)
        tableView.keyboardDismissMode = .onDrag
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo((controller?.view.snp.top)!).offset(IPHONEX ? -44 : 64)
            make.left.equalTo((controller?.view.snp.left)!).offset(0)
            make.right.equalTo((controller?.view.snp.right)!).offset(0)
            make.bottom.equalTo((controller?.view.snp.bottom)!).offset(0)
        }
        
    }
    
    func bindViewModel(viewModel:BaseViewModel?, controller: BaseViewController?){
        self.viewModel = viewModel
        viewModel?.controller = controller
    }
    
    func changeTableViewFrame(frame:CGRect) {
        tableView.frame = frame
    }
    
    func setUpRefreshData(refresh:MJRefreshNormalHeader){
        self.tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            refresh
        })
    }
    
    func stopRefresh(){
        self.tableView.mj_header.endRefreshing()
    }
    
    func setUpLoadMoreData(refresh:MJRefreshNormalHeader){
        self.tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            refresh
        })
    }
    
    func stopLoadMoreData(){
        self.tableView.mj_footer.endRefreshing()
    }
    
    func getViewModel(){
        
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
