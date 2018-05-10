//
//  MineViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

typealias HiddenTopNavigationBar = () ->Void

class MineViewController: BaseViewController {

    var hiddenTopNavigationBar:HiddenTopNavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bindViewModel(viewModel: MineViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloabImageTitleAndRightCell.self, MineHeaderTableViewCell.self], controller: self)
        self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.fd_prefersNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if hiddenTopNavigationBar != nil {
            self.hiddenTopNavigationBar()
        }
    }
    
    func setUpNavigationItem(){
        let rightButton = UIButton.init(type: .custom)
        rightButton.reactive.controlEvents(.touchUpInside).observe { (action) in
            self.rightBarItemPress()
        }
        self.view.addSubview(rightButton)
        rightButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.top.equalTo(self.view.snp.top).offset(IPHONEX ? 40 : 28)
            make.size.equalTo(CGSize.init(width: 36, height: 36))
        }
        rightButton.setImage(UIImage.init(named: "settings"), for: .normal)
        
    }
    
    @objc func rightBarItemPress(){
        
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
