//
//  UserInfoModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class UserInfoModel: NSObject {

    var user_id:String?
    
    static let shareInstance = UserInfoModel()
    
    class func isLoggedIn() ->Bool{
        let user_id = UserDefaultsGetSynchronize("USERID") as! String
        if user_id != "nil" {
            return true
        }
        return false
    }
    
    class func logout() {
        UserDefaults.standard.removeObject(forKey: "USERID")
    }
    
    override init() {
        super.init()
        let user_id = UserDefaultsGetSynchronize("USERID") as! String
        if user_id != "nil"{
            self.user_id = user_id
        }
    }
    
    init(fromDictionary dictionary: NSDictionary){
        super.init()
        self.user_id = dictionary["user_id"] as? String
        UserDefaultsSetSynchronize(dictionary["user_id"] as AnyObject, key: "USERID")
//        self.save()
    }
}
