//
//  Define.swift
//  LiangPiao
//
//  Created by Zhang on 28/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import SwifterSwift

let APPVERSION = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

let IPHONE_VERSION:Int = (UIDevice.current.systemVersion as! NSString).integerValue
let IPHONE_VERSION_LAST9 = IPHONE_VERSION >= 9 ? true:false
let IPHONE_VERSION_LAST10 = IPHONE_VERSION >= 10 ? true:false
let IPHONE_VERSION_MINE11 = IPHONE_VERSION < 11 ? true:false

let IPHONE4 = SCREENHEIGHT == 480 ? true:false
let IPHONE5 = SCREENHEIGHT == 568 ? true:false
let IPHONE6 = SCREENHEIGHT == 667 ? true:false
let IPHONE6P = SCREENWIDTH == 414 ? true:false
let IPHONE7P = SCREENHEIGHT == 736 ? true:false
let IPHONEX = SCREENHEIGHT == 812.0 ? true : false

let IPAD = UIDevice.current.userInterfaceIdiom == .pad ? true : false

let IPHONEWIDTH320 = SCREENWIDTH == 320 ? true:false
let IPHONEWIDTH375 = SCREENWIDTH == 375 ? true:false
let IPHONEWIDTH414 = SCREENWIDTH == 414 ? true:false

let IPHONEXFRAMEHEIGHT:CGFloat = IPHONEX ? 24 : 0 
let IPHONEXTABBARHEIGHT:CGFloat = IPHONEX ? 30 : 0

let SCREENWIDTH = SwifterSwift.screenWidth
let SCREENHEIGHT = SwifterSwift.screenHeight

let AnimationTime = 0.3

let TitleLineSpace:Float = 3.0

let WeiXinPayStatues = "WeiXinPayStatuesChange"
let AliPayStatues = "AliPayStatuesChange"

let APPCONFIGSTATUS = "APPCONFIGSTATUS"

let WANGYIIMAPPKEY = "04fdcc5868d168349f86a52c04a9d426"

let FIRSTSTATAPP = "FIRSTSTARTAPP"
let AppVersion = "AppVersion"

let WeiXinAppID = "wxde874e2be98bd508"
let WeiXinSECRET = ""
let WeiXinCode = "GetWeiXinCode"
let QQAppID = "1106567944"
let QQAppKey = "KEYbSfLwgRaskE6SWyq"

let WeiboApiKey   =    "3220687526"
let WeiboApiSecret =   "97f3d51f3a1017cf54268accf9b83391"
let WeiboRedirectUrl = "http://sns.whalecloud.com/sina2/callback"

let LoginStatuesChange = "LoginStatuesChange"
let ChangeUserInfoData = "ChangeUserInfoData"

let PayStatusChange = "PayStatusChange"
let BlanceNumberChange = "BlanceNumberChange"

let DeviceTokenData = "DeviceTokenData"

func KWINDOWDS() -> UIWindow{
    let window = UIApplication.shared.keyWindow
    return window!
}

let SHARE_APPLICATION = UIApplication.shared

func AppCallViewShow(_ view:UIView, phone:String) {
    UIAlertController.shwoAlertControl(view.findViewController()!, style: .alert, title: "联系抓我电话客服", message: phone, cancel: "取消", doneTitle: "确定", cancelAction: {
        
        }, doneAction: {
           UIApplication.shared.openURL(URL.init(string: "tel:\(phone)")!)
    })
}

func UserDefaultsSetSynchronize(_ value:AnyObject,key:String) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}



func UserDefaultsGetSynchronize(_ key:String) -> AnyObject{
    if UserDefaults.standard.object(forKey: key) == nil {
        return "nil" as AnyObject
    }
    return UserDefaults.standard.object(forKey: key)! as AnyObject
}

func Storyboard(_ name:String,controllerid:String) -> UIViewController{
    return UIStoryboard.init(name: name, bundle: nil).instantiateViewController(withIdentifier: controllerid)
}

func Notification(_ name:String,value:String?) {
    NotificationCenter.default.post(name: Foundation.Notification.Name(rawValue: name), object: value)
}


func NavigationPushView(_ formviewController:UIViewController, toConroller:UIViewController) {
    toConroller.hidesBottomBarWhenPushed = true
    formviewController.navigationController?.pushViewController(toConroller, animated: true)
}

func NavigaiontPresentView(_ formViewController:UIViewController, toController:UIViewController) {
    formViewController.present(toController, animated: true) {
        
    }
}

func MainThreadAlertShow(_ msg:String,view:UIView){
    DispatchQueue.main.async(execute: {
        _ = Tools.shareInstance.showMessage(view, msg: msg, autoHidder: true)
    })
}

func jsonStringToDic(_ dictionary_temp:String) ->NSDictionary {
    let data = dictionary_temp.data(using: String.Encoding.utf8)! as NSData
    let dictionary_temp_temp = try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
    return dictionary_temp_temp as! NSDictionary
    
}

func MainThreanShowErrorMessage(_ error:AnyObject){
    if error is NSDictionary {
        DispatchQueue.main.async(execute: {
            _ = Tools.shareInstance.showErrorMessage(error)
        })
    }
}

func MainThreanShowNetWorkError(_ error:AnyObject){
    DispatchQueue.main.async(execute: {
        _ = Tools.shareInstance.showNetWorkError(error)
    })
}

func numberChangeStr(number:Int) ->String{
    var str = ""
    if number > 10000 {
        str = "\(Float(number/10000))W"
    }else{
        str = "\(number)"
    }
    return str
}



