//
//  BaseNetWorke.swift
//  LiangPiao
//
//  Created by Zhang on 28/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import UIKit
import Alamofire
import Result
import ReactiveSwift
import MBProgressHUD

typealias SuccessClouse = (_ responseObject:AnyObject) -> Void
typealias FailureClouse = (_ responseError:AnyObject) -> Void

enum HttpRequestType {
    case post
    case get
    case delete
    case put
}

class BaseNetWorke {
    fileprivate init() {
    
    }
    
    static let sharedInstance = BaseNetWorke()
    //加一个特使标识，首页请求失败
    /// getRequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号

    func getUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber, liftTime) in
            self.httpRequest(.get, url: url, parameters: parameters, success: { (responseObject) in
                print(responseObject)
                if (responseObject as! NSDictionary).object(forKey: "code")! as! String == "0" {
                    subscriber.send(value: (responseObject as! NSDictionary))
                }
                subscriber.sendCompleted()
            }, failure: { (responseError) in
                if responseError is NSDictionary {
                    MainThreanShowErrorMessage(responseError)
                }else{
                    MainThreanShowNetWorkError(responseError)
                    subscriber.sendCompleted()
                }
                subscriber.sendCompleted()
            })
        })
    }
    /// postRequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func postUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber, liftTime) in
            self.httpRequest(.post, url: url, parameters: parameters, success: { (responseObject) in
                if (responseObject as! NSDictionary).object(forKey: "code")! as! String == "0" {
                    subscriber.send(value: (responseObject as! NSDictionary))
                }else{
//                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: (responseObject as! NSDictionary).object(forKey: "message") as! String, autoHidder: true)
                }
                subscriber.sendCompleted()
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        print(responseError)
                        MainThreanShowNetWorkError(responseError)
                    }
                subscriber.sendCompleted()
            })
        })
        
    }
    
    /// Putrequest
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func putUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber, liftTime) in
            self.httpRequest(.put, url: url, parameters: parameters, success: { (responseObject) in
                if (responseObject as! NSDictionary).object(forKey: "code")! as! String == "0" {
                    subscriber.send(value: (responseObject as! NSDictionary))
                }else{
//                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: (responseObject as! NSDictionary).object(forKey: "message") as! String, autoHidder: true)
                }
                subscriber.sendCompleted()
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        MainThreanShowNetWorkError(responseError)
                    }
                subscriber.sendCompleted()
            })
        })
    }
    
    /// 删除request
    ///
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func deleteUrlWithString(_ url:String, parameters:AnyObject?) -> Signal<Any, NSError> {
        return Signal.init({ (subscriber, liftTime) in
            self.httpRequest(.delete, url: url, parameters: parameters, success: { (responseObject) in
                if (responseObject as! NSDictionary).object(forKey: "code")! as! String == "0" {
                    subscriber.send(value: (responseObject as! NSDictionary))
                }else{
//                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: (responseObject as! NSDictionary).object(forKey: "message") as! String, autoHidder: true)
                }
                subscriber.sendCompleted()
                }, failure: { (responseError) in
                    if responseError is NSDictionary {
                        MainThreanShowErrorMessage(responseError)
                    }else{
                        MainThreanShowNetWorkError(responseError)
//                        subscriber.send(error: responseError as! NSError)
                    }
                subscriber.sendCompleted()
            })
        })
    }
    
    
    func uploadDataFile(_ url:String, parameters:NSDictionary?, images:NSDictionary?, hud:MBProgressHUD?) ->Signal<Any, NSError> {
        return Signal.init({ (subscriber, liftTime) in
            let headers:HTTPHeaders?
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if parameters != nil {
                    for i in 0...(parameters!).allValues.count - 1 {
                        multipartFormData.append((parameters!.allValues[i] as! String).data(using: String.Encoding.utf8, allowLossyConversion: true)!, withName: parameters!.allKeys[i] as! String)
                    }
                }
                
                if images != nil {
                    for j in 0...(images!).allValues.count - 1 {
                        multipartFormData.append(URL.init(fileURLWithPath: images?.allValues[j] as! String), withName: (images!).allKeys[j] as! String)
                    }
                }
                print(multipartFormData)
            }, usingThreshold: 1, to: url, method: .post, headers: nil) { (encodingResult) in
                print(encodingResult)
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString(completionHandler: { (response) in
                        if response.result.value != nil {
                            if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                                let dic = jsonStringToDic(response.result.value!)
                                if dic.object(forKey: "code") as! String == "0" {
                                    subscriber.send(value: dic.object(forKey: "data") as Any)
                                }else{
//                                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: dic.object(forKey: "message") as! String, autoHidder: true)
                                }
                            }else{
//                                _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
                            }
                        }else{
//                            _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
                        }
                        if hud != nil {
                            hud?.hide(animated: true)
                            Tools.shareInstance.hiddenLoading(hud: hud!)
                        }
                        subscriber.sendCompleted()
                    })
                case .failure(let encodingError):
                    print(encodingError)
                    if hud != nil {
                        Tools.shareInstance.hiddenLoading(hud: hud!)
                    }
//                    _ = Tools.shareInstance.showMessage(KWINDOWDS(), msg: "上传失败", autoHidder: true)
                    subscriber.sendCompleted()
                }
            }
        })
    }
    
    ///
    /// - parameter url:        输入URL
    /// - parameter parameters: 参数
    ///
    /// - returns: 一个信号
    func httpRequest(_ type:HttpRequestType,url:String, parameters:AnyObject?, success:@escaping SuccessClouse, failure:@escaping FailureClouse) {
        
        var methods:HTTPMethod
        switch type {
            case .post:
                methods = HTTPMethod.post
            case .get:
                methods = HTTPMethod.get
            case .delete:
                methods = HTTPMethod.delete
            default:
                methods = HTTPMethod.put
        }
        let headers:HTTPHeaders? = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "postman-token": "303c9df6-22ab-8411-8baf-0ff9a6aeb424"
        ]
        if UserInfoModel.isLoggedIn() {
//            (parameters as! [String:Any]). .addEntries(from: ["user_id":UserInfoModel.shareInstance.user_id!])
        }
        let encod:ParameterEncoding? = URLEncoding.default
        print("\(url)===============\(String(describing: parameters))==================\(String(describing: headers))")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: methods , parameters: parameters as? [String: Any], encoding: encod!, headers: headers).responseString(completionHandler: { (response) in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(response)
            if response.result.error != nil{
                failure(response.result.error! as AnyObject)
            }else{
                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                    let dic = jsonStringToDic(response.result.value!)
                    success(dic as AnyObject)
                }else{
                    failure(response.result.value! as AnyObject)
                }
            }
        })
        
    }
    
    
}
