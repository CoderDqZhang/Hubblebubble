//
//  UserInfoModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class UserInfoModel: JKDBModel {

    var neteaseAccountId:String?
    
    static let shareInstance = UserInfoModel()
    
    class func isLoggedIn() ->Bool{
        return true
    }
}
