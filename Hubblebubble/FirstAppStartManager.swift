//
//  FirstAppStartManager.swift
//  CatchMe
//
//  Created by Zhang on 17/01/2018.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class FirstAppStartManager: NSObject {
    
    class func getFirstAppStart() -> Bool {
        let currentAppVersion = APPVERSION
        let userDefaults = UserDefaultsGetSynchronize(AppVersion)
        if userDefaults as! String == "nil" {
            UserDefaultsSetSynchronize(currentAppVersion as AnyObject, key: AppVersion)
            return true
        }else if userDefaults as! String == currentAppVersion{
//            return true
            return false
        }else{
            UserDefaultsSetSynchronize(currentAppVersion as AnyObject, key: AppVersion)
            return true
        }
    }
}
