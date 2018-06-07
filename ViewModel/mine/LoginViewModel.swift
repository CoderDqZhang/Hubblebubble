//
//  LoginViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/6/1.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class LoginViewModel: BaseViewModel {

    var userInfo:UserInfoModel!
    override init() {
        super.init()
    }
    
    func requestLogin(phone:String,code:String){
        let url = "\(ROOT_URL)\(LOGIN)"
        let parameters = ["mobile":"18363899723","captcha":"1234"]
//        let parameters = ["mobile":phone,"captcha":code]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted{
                self.userInfo =  UserInfoModel.init(fromDictionary: (resultDic.value as! NSDictionary))
                self.controller?.navigationController?.popViewController()
            }
        }
    }
    
    func requestCode(phone:String){
        let url = "\(ROOT_URL)\(MOBILE_CAPTCHA)"
        let parameters = ["mobile":phone]
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters as AnyObject).observe { (resultDic) in
            if !resultDic.isCompleted{
                self.userInfo =  UserInfoModel.init(fromDictionary: (resultDic.value as! NSDictionary))
                self.controller?.dismiss(animated: true, completion: {
                    
                })
            }
        }
    }
}
