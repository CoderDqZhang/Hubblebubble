//
//  BottomView.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/6/5.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

enum BottomViewType {
    case parase
    case collect
    case share
    case send
}

typealias BottomViewClouse = (_ type:BottomViewType, _ str:String?) -> Void

class BottomView: UIView {

    var textField:UITextField!
    var paresButton:UIButton!
    var collectButton:UIButton!
    var shareButton:UIButton!
    var bottomViewClouse:BottomViewClouse!
    init(frame:CGRect,bottomViewClouse:@escaping BottomViewClouse) {
        super.init(frame: frame)
        self.bottomViewClouse = bottomViewClouse
        self.setUpView()
    }
    
    func setUpView(){
        textField = UITextField.init()
        textField.layer.cornerRadius = 15
        textField.placeholder = "留言"
        textField.addPaddingLeft(10)
        
        textField.keyboardType = .default
        textField.returnKeyType = .send
        textField.borderWidth = 0.5
        textField.borderColor = UIColor.init(hexString: App_Theme_DDE0E5_Color)
        textField.delegate = self
        textField.setPlaceholderFont(App_Theme_PinFan_R_10_Font, color: UIColor.init(hexString: App_Theme_A0A0A0_Color))
        self.addSubview(textField)
        
        paresButton = UIButton.init(type: .custom)
        paresButton.reactive.controlEvents(UIControlEvents.touchUpInside).observe { (button) in
            if self.bottomViewClouse != nil {
                self.bottomViewClouse(.parase, nil)
            }
        }
        paresButton.setImage(UIImage.init(named: "点赞"), for: .normal)
        self.addSubview(paresButton)
        
        collectButton = UIButton.init(type: .custom)
        collectButton.setImage(UIImage.init(named: "收藏"), for: .normal)
        collectButton.reactive.controlEvents(UIControlEvents.touchUpInside).observe { (button) in
            if self.bottomViewClouse != nil {
                self.bottomViewClouse(.collect, nil)
            }
        }
        self.addSubview(collectButton)
        
        shareButton = UIButton.init(type: .custom)
        shareButton.setImage(UIImage.init(named: "分享"), for: .normal)
        shareButton.reactive.controlEvents(UIControlEvents.touchUpInside).observe { (button) in
            if self.bottomViewClouse != nil {
                self.bottomViewClouse(.share, nil)
            }
        }
        self.addSubview(shareButton)
        
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.right.equalTo(self.paresButton.snp.left).offset(-5)
        }
        
        paresButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 20, height: 20))
            make.centerY.equalToSuperview()
            make.right.equalTo(self.collectButton.snp.left).offset(-5)
        }
        
        collectButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 20, height: 20))
            make.centerY.equalToSuperview()
            make.right.equalTo(self.shareButton.snp.left).offset(-5)
        }
        
        shareButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 20, height: 20))
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).offset(-15)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BottomView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if self.bottomViewClouse != nil {
            self.bottomViewClouse(.send, textField.text)
        }
        return true
    }
}
