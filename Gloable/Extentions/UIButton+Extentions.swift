
//
//  UIButton+Extentions.swift
//  LiangPiao
//
//  Created by Zhang on 12/12/2016.
//  Copyright © 2016 Zhang. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func buttonSetThemColor(_ bgColor:String, selectColor:String, size:CGSize) {
        self.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: bgColor), size: size), for: UIControlState())
        self.setBackgroundImage(UIImage.init(color: UIColor.init(hexString: selectColor), size: size), for: .highlighted)
    }
    
    func buttonSetTitleColor(_ nTitleColor:String, sTitleColor:String?) {
        self.setTitleColor(UIColor.init(hexString: nTitleColor), for: UIControlState())
        if sTitleColor == nil {
            self.setTitleColor(UIColor.init(hexString: UIColor.init(hexString: App_Theme_FFFFFF_Color)), for: .highlighted)
        }else{
            self.setTitleColor(UIColor.init(hexString: sTitleColor), for: .highlighted)
        }
    }
    
    func buttonSetImage(_ nImage:UIImage, sImage:UIImage) {
        self.setImage(nImage, for: UIControlState())
        self.setImage(sImage, for: .selected)
        self.setImage(sImage, for: .highlighted)
    }
    
    func verticalImageAndTitle(spacing:CGFloat) {
        let imageSize = self.imageView?.frame.size
        var titleSize = self.titleLabel?.frame.size
        let textSize = (self.titleLabel?.text as! NSString).size(with: self.titleLabel?.font, constrainedToWidth: 0)
        let frameSize = CGSize.init(width: textSize.width, height: textSize.height)
        if (titleSize?.width)! + 0.5 < frameSize.width {
            titleSize?.width = frameSize.width
        }
        let totalHeight = (imageSize?.height)! + (titleSize?.height)! + spacing
        self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - (imageSize?.height)!), 0.0, 0.0, -(titleSize?.width)!)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageSize?.width)!, -(totalHeight - (titleSize?.height)!), 0)
    }
    
    
    func set(image anImage: UIImage?, title: String,
                   titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = self.imageRect(forContentRect: self.frame)
        let titleFont = self.titleLabel?.font!
        let titleSize = (title as! NSString).size(with: self.titleLabel?.font, constrainedToWidth: 0)
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
