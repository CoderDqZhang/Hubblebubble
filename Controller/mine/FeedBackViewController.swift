
//
//  FeedBackViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class FeedBackViewController: BaseViewController {

    var textView:UITextView!
    var textField:UITextField!
    var button:CustomTouchButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func setUpViewNavigationItem() {
        self.navigationItem.title = "意见反馈"
    }
    
    override func setUpView() {
        self.textView = UITextView.init()
        self.textView.placeholder = "请输入反馈，我们将为您不断改进"
        self.view.addSubview(self.textView)
        
        self.textField = UITextField.init()
        self.textField.addPaddingLeft(10)
        self.textField.layer.borderColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)?.cgColor
        self.textField.layer.borderWidth = 0.5
        self.textField.font = App_Theme_PinFan_R_15_Font
        self.textField.textColor = UIColor.init(hexString: App_Theme_A0A0A0_Color)
        self.textField.setPlaceholderFont(App_Theme_PinFan_R_15_Font, color: UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.textField.placeholder = "请填写您的联系方式（手机号或者邮箱）"
        self.view.addSubview(textField)
        
        self.button = CustomTouchButton.init(frame: CGRect.init(x:(SCREENWIDTH - 225)/2, y: 0, width: 225, height: 44), title: "提交", tag: 0, titleFont: App_Theme_PinFan_R_15_Font, type: CustomButtonType.withBackBoarder, pressClouse: { (tag) in
            if (self.textView.text == "" || self.textField.isEmpty) {
                _ = Tools.shareInstance.showLoading(KWINDOWDS(), msg: "请输入反馈意见")
                return
            }
        })
        
        self.view.addSubview(button)
        
        self.textView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.top.equalTo(self.view.snp.top).offset(15)
            make.height.equalTo(150)
        }
        
        self.textField.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.top.equalTo(self.textView.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        
        self.button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.textField.snp.bottom).offset(40)
            make.size.equalTo(CGSize.init(width: 225, height: 35))
        }
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
