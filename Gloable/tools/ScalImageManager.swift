//
//  ScalImageManager.swift
//  CatchMe
//
//  Created by Zhang on 10/01/2018.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ScalImageManager: NSObject {

    override init() {
        super.init()
    }
    
    class func scalImageManager(image:UIImage, showSize:CGSize) -> UIImage {
        let size = image.size
        let newSize:CGSize!
        var isWidth:Bool = true
        if Double(size.width / size.height) > Double(showSize.width / showSize.height) {
            newSize = CGSize.init(width: (image.size.height - 2) * showSize.width / showSize.height, height: (image.size.height - 2))
            isWidth = true
        }else{
            newSize = CGSize.init(width: (image.size.width - 2) , height: (image.size.width - 2) * showSize.height / showSize.width)
            isWidth = false
        }
        let newImage = image.scale(to: newSize)
        return newImage!
    }
    
    class func mineScalImageManager(image:UIImage, showSize:CGSize) -> UIImage {
        let size = image.size
        let newSize:CGSize!
        var isWidth:Bool = true
        if size.width / size.height > showSize.width / showSize.height {
            newSize = CGSize.init(width: image.size.height * showSize.width / showSize.height, height: image.size.height)
            isWidth = true
        }else{
            newSize = CGSize.init(width: image.size.width , height: image.size.width * showSize.height / showSize.width)
            isWidth = false
        }
        let point = isWidth ? CGPoint.init(x: (image.size.width / newSize.width) / 2, y: 0) : CGPoint.init(x: 0, y: (image.size.height / newSize.height) / 2)
        let newImage = image.cropped(to: CGRect.init(origin: point, size: newSize))
        return newImage
    }

}
