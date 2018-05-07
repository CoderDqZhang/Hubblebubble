//
//  BaseViewModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/7.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit
import SwifterSwift
import DZNEmptyDataSet

class BaseViewModel: NSObject {

    var controller:BaseViewController?
    
    override init() {
        super.init()
    }
}

extension BaseViewModel : DZNEmptyDataSetDelegate {
    
}

extension BaseViewModel : DZNEmptyDataSetSource {
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let attributed = "暂时没有数据哦~"
        let attributedString = NSMutableAttributedString.init(string: attributed)
        attributedString.addAttributes([NSAttributedStringKey.font:App_Theme_PinFan_M_16_Font,NSAttributedStringKey.foregroundColor:UIColor.init(hexString: App_Theme_CCCCCC_Color)!], range: NSRange.init(location: 0, length: attributed.length))
        
        return attributedString
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage.init(named: "pic_toy")
    }
    
    func verticalOffset(forEmptyDataSet scrollView: UIScrollView!) -> CGFloat {
        return -64
    }
}
