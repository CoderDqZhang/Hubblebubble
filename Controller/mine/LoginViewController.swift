//
//  LoginViewController.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    var locationNumber:UIButton!
    var mobileTextField:UITextField!
    var codeField:UITextField!
    var senderButton:UIButton!
    var loginButton:CustomTouchButton!
    
    var timeDownLabel:CountDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setUpViewNavigationItem() {
        self.navigationItem.title = "登录"
    }
    
    override func setUpView() {
        let phoneView = UIView.init()
        phoneView.layer.borderColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)?.cgColor
        phoneView.layer.borderWidth = 0.5
        let lineView = GloabLineView.init(frame: CGRect.zero)
        phoneView.addSubview(lineView)
        self.locationNumber = UIButton.init(type: .custom)
        self.locationNumber.setTitle("+86", for: .normal)
        self.locationNumber.setTitleColor(UIColor.init(hexString: App_Theme_DDE0E5_Color), for: .normal)
        self.locationNumber.titleLabel?.font = App_Theme_PinFan_R_18_Font
        phoneView.addSubview(self.locationNumber)
        
        self.mobileTextField = UITextField.init()
        self.mobileTextField.addPaddingLeft(10)
        self.mobileTextField.keyboardType = .numberPad
        self.mobileTextField.returnKeyType = .next
        self.mobileTextField.textAlignment = .left
        self.mobileTextField.setPlaceholderFont(App_Theme_PinFan_R_15_Font, color: UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.mobileTextField.reactive.continuousTextValues.observeValues { (str) in
            if str?.length == 11 {
                self.senderButton.isEnabled = true
            }else{
                self.senderButton.isEnabled = false
            }
        }
        self.mobileTextField.placeholder = "请输入手机号"
        phoneView.addSubview(self.mobileTextField)
        
        let codeView = UIView.init()
        codeView.layer.borderColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)?.cgColor
        codeView.layer.borderWidth = 0.5
        self.codeField = UITextField.init()
        self.codeField.addPaddingLeft(10)
        self.codeField.font = App_Theme_PinFan_R_15_Font
        self.codeField.setPlaceholderFont(App_Theme_PinFan_R_15_Font, color: UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.codeField.textAlignment = .left
        self.codeField.keyboardType = .numberPad
        self.codeField.returnKeyType = .next
        self.codeField.placeholder = "请输入验证码"
        codeView.addSubview(self.codeField)
        
        self.senderButton = UIButton.init(type: .custom)
        self.senderButton.setTitle("发送验证码", for: .normal)
        self.senderButton.titleLabel?.font = App_Theme_PinFan_R_14_Font
        self.senderButton.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.setUpCountDown()
        }
        self.senderButton.layer.insertSublayer(ColorTools.changeColor(startColor: UIColor.init(hexString: App_Theme_9FC8FC_Color), endColor: UIColor.init(hexString: App_Theme_F4A0E7_Color), frame: CGRect.init(x: 0, y: 0, width: 124, height: 44)), at: 0)
        codeView.addSubview(self.senderButton)
        
        
        
        let descLabel = UILabel.init()
        descLabel.text = "未注册过的手机号将自动注册成为泡椒用户"
        descLabel.setUpLabel(App_Theme_PinFan_R_12_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
       self.view.addSubview(descLabel)
        
        let procol = UILabel.init()
        UITapGestureRecognizerManager.initTapGestureRecognizer(view: procol) {
            NavigationPushView(self, toConroller: ProtocolViewController())
        }
        procol.text = "注册表面您同意泡椒《用户协议》"
        procol.setUpLabel(App_Theme_PinFan_R_12_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.view.addSubview(procol)
        procol.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-30)
            make.centerX.equalToSuperview()
        }
        
        self.loginButton = CustomTouchButton.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH - 52, height: 44), title: "登录", tag: 0, titleFont: App_Theme_PinFan_R_15_Font, type: CustomButtonType.withBackBoarder, pressClouse: { (tag) in
        })
        self.view.addSubview(self.loginButton)
        
        self.view.addSubview(phoneView)
        self.view.addSubview(codeView)
        
        
        
        phoneView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(36 + 64)
            make.left.equalTo(self.view.snp.left).offset(26)
            make.right.equalTo(self.view.snp.right).offset(-26)
            make.height.equalTo(44)
        }
        
        self.locationNumber.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalTo(75)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(self.locationNumber.snp.right).offset(0)
            make.size.equalTo(CGSize.init(width: 1, height: 30))
            make.centerY.equalToSuperview()
        }
        
        self.mobileTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalTo(self.locationNumber.snp.right).offset(0)
        }
        
        codeView.snp.makeConstraints { (make) in
            make.top.equalTo(phoneView.snp.bottom).offset(15)
            make.left.equalTo(self.view.snp.left).offset(26)
            make.right.equalTo(self.view.snp.right).offset(-26)
            make.height.equalTo(44)
        }
        
        self.senderButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(124)
        }
        
        self.codeField.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalTo(self.senderButton.snp.left).offset(0)
            make.bottom.equalToSuperview()
            make.left.equalTo(codeView.snp.left).offset(0)
        }
        
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(codeView.snp.bottom).offset(10)
            make.left.equalTo(self.view.snp.left).offset(26)
            make.right.equalTo(self.view.snp.right).offset(-26)
        }
        
        self.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(codeView.snp.bottom).offset(35)
            make.left.equalTo(self.view.snp.left).offset(26)
            make.right.equalTo(self.view.snp.right).offset(-26)
            make.height.equalTo(40)
        }
    }
    
    func setUpCountDown(){
        if timeDownLabel == nil {
            timeDownLabel = CountDown()
        }
        let aMinutes:TimeInterval = 60
        self.startWithStartDate(NSDate() as Date, finishDate: NSDate.init(timeIntervalSinceNow: aMinutes) as Date)
    }
    
    func startWithStartDate(_ date:Date, finishDate:Date){
        UserDefaultsSetSynchronize("true" as AnyObject, key: "isLoginTime")
        UserDefaultsSetSynchronize("nil" as AnyObject, key: "isLoginEnterBack")
        UserDefaultsSetSynchronize(0 as AnyObject, key: "backGroundTime")
        timeDownLabel.countDown(withStratDate: date, finish: finishDate) { (day, hours, minutes, seconds) in
            var totoalSecod = day*24*60*60+hours*60*60+minutes*60+seconds
            if UserDefaultsGetSynchronize("isLoginEnterBack") as! String != "nil"{
                totoalSecod = totoalSecod - (UserDefaultsGetSynchronize("backGroundTime") as! Int)
            }
            if totoalSecod == 0 {
                UserDefaultsSetSynchronize(0 as AnyObject, key: "backGroundTime")
                self.senderButton.isEnabled = true
                self.senderButton.setTitle("重新发送", for: .normal)
            }else{
                self.senderButton.isEnabled = false
                self.senderButton.setTitle("获取验证码\(totoalSecod)s", for: .normal)
            }
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
