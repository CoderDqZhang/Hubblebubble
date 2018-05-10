//
//  GoodsViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit
import MJRefresh

class GoodsViewController: BaseViewController {

    var collectView:UICollectionView!
    var goodViewModel = GoodsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.setUpCollectView()
        self.setUpCollectViewRefreshData()
        // Do any additional setup after loading the view.
    }
    
    func setUpCollectView(){
        let layout = UICollectionViewFlowLayout.init()
        layout.headerReferenceSize = CGSize.init(width: SCREENWIDTH, height: SCREENWIDTH * 80 / 188)
        collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: IPHONEX ? -44 : -20, width: SCREENWIDTH, height: SCREENHEIGHT + (IPHONEX ? 22 : 0)), collectionViewLayout: layout)
        collectView.backgroundColor = UIColor.init(hexString: App_Theme_FAFAFA_Color)
        collectView.delegate = goodViewModel
        collectView.dataSource = goodViewModel
        self.view.addSubview(collectView)
        collectView.register(GoodsCollectionViewCell.self, forCellWithReuseIdentifier: GoodsCollectionViewCell.description())
        collectView.register(GoodHeaderCollectionViewCell.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionHeader", withReuseIdentifier: GoodHeaderCollectionViewCell.description())
        collectView.register(GoodFooterCollectionViewCell.self, forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier: GoodFooterCollectionViewCell.description())
    }

    
    func setUpCollectViewRefreshData(){
        self.collectView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
           
        })
    }
    
    func setUpCollectViewLoadMoreData(){
        self.collectView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
        })
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
