//
//  TagView.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/6/5.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

typealias TagViewClouse = (_ tag:NSInteger, _ name:String) ->Void

class TagView: UIView {

    var frames = NSMutableArray.init()
    var tagViewClouse:TagViewClouse!
    init(frame:CGRect, model:MoodModel, isImage:Bool,clouse:@escaping TagViewClouse) {
        super.init(frame: frame)
        self.tagViewClouse = clouse
        self.setUpView(frame: frame, model: model, isImage: isImage)
    }
    
    func setUpView(frame:CGRect,model:MoodModel,isImage:Bool){
        
        for str in model.moodList {
            let size = UIImage.init(named: str.name)?.size
            if size == nil {
                return
            }
            let originX = CGFloat(arc4random_uniform(UInt32(frame.size.width)))
            let originY = CGFloat(arc4random_uniform(UInt32(frame.size.height)))
            let tagframe = CGRect.init(x: originX, y: originY, width: (size?.width)!, height: (size?.height)!)
            frames.add(tagframe)
            let button = UIButton.init()
            button.frame = tagframe
            button.tag = Int(str.id)!
            button.reactive.controlEvents(.touchUpInside).observe { (button) in
                if self.tagViewClouse != nil {
                    self.tagViewClouse((button.value?.tag)!,str.name)
                }
            }
            button.setImage(UIImage.init(named: str.name), for: .normal)
            self.addSubview(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
