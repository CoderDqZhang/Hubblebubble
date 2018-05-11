//
//  UITapGestureRecognizer+Extention.swift
//  CatchMe
//
//  Created by Zhang on 20/11/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

typealias TapGestureRecognizerClouse = ()->Void

var tapGestureRecognizerClouse:TapGestureRecognizerClouse!
class UITapGestureRecognizerManager {
    
    class func initTapGestureRecognizer(view:UIView?,tapGestureRecognizer:@escaping TapGestureRecognizerClouse) -> UITapGestureRecognizer{
        view?.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer.init(target: self, action: #selector(UITapGestureRecognizerManager.tapSelector))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        view?.addGestureRecognizer(singleTap)
        tapGestureRecognizerClouse = tapGestureRecognizer
        return singleTap
    }

    @objc func tapSelector(){
        tapGestureRecognizerClouse()
    }
}
