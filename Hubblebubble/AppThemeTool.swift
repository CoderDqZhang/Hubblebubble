//
//  AppThemeTool.swift
//  LiangPiao
//
//  Created by Zhang on 31/10/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

class AppleThemeTool {
    class func setUpToolBarColor() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.init(hexString: App_Theme_333333_Color) ?? ""], for: UIControlState())
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.init(hexString: App_Theme_F94856_Color) ?? ""], for: .selected)
        UITabBar.appearance().tintColor = UIColor.init(hexString: App_Theme_F94856_Color)
        UITabBar.appearance().backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color, andAlpha: 0.5)
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.clear
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font:App_Theme_PinFan_R_17_Font,NSAttributedStringKey.foregroundColor:UIColor.init(hexString: App_Theme_FFFFFF_Color) ?? ""]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font:App_Theme_PinFan_R_15_Font,NSAttributedStringKey.foregroundColor:UIColor.init(hexString: App_Theme_FFFFFF_Color) ?? ""], for: UIControlState())
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: false)
        //渐变色
        //插入渐变色
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(color: UIColor.init(hexString: App_Theme_FFFFFF_Color, andAlpha: 0), size: CGSize.init(width: SCREENWIDTH, height: 64)), for: .default)
        UINavigationBar.appearance().layer.insertSublayer(ColorTools.changeColor(startColor: UIColor.init(hexString: App_Theme_9FC8FC_Color), endColor: UIColor.init(hexString: App_Theme_F4A0E7_Color), frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: 64)), at: 0)
        
        UINavigationBar.appearance().shadowImage = UIImage.init()
        
    }
    
    class func setUpKeyBoardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false

    }
}
