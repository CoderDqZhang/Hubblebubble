//
//  SettingViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {

    var logout:CustomTouchButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel(viewModel: SettingViewModel(), controller: self)
        self.setUpTableView(style: .grouped, cells: [GloableTitleLabelTitleDescCell.self], controller: self)
        // Do any additional setup after loading the view.
    }

    override func setUpView() {
        self.logout = CustomTouchButton.init(frame: CGRect.init(x: 0, y: SCREENHEIGHT - 44, width: SCREENWIDTH, height: 44), title: "退出登录", tag: 0, titleFont: App_Theme_PinFan_R_15_Font, type: CustomButtonType.withBackBoarder, pressClouse: { (tag) in
            
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
