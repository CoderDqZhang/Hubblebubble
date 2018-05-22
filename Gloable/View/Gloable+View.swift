//
//  Gloable+View.swift
//  CatchMe
//
//  Created by Zhang on 18/11/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class Gloable_View: NSObject {

}

class GloabLineView: UIView {
    
    let lineLabel:UIImageView = UIImageView.init()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        lineLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        lineLabel.backgroundColor = UIColor.init(hexString: App_Theme_EEEEEE_Color)
        self.addSubview(lineLabel)
    }
    
    func setLineColor(_ color:UIColor){
        lineLabel.backgroundColor = color
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum CustomButtonType {
    case withNoBoarder
    case withBoarder
    case withBackBoarder
    case widthDisbale
    
}

typealias CustomButtonClouse = (_ tag:NSInteger) -> Void
class CustomTouchButton: AnimationTouchView {
    
    var topButton:UIButton!
    
    var isEnabled:Bool = false
    
    init(frame:CGRect, title:String, tag:NSInteger?, titleFont:UIFont, type:CustomButtonType, pressClouse:@escaping CustomButtonClouse) {
        super.init(frame: frame) {
            pressClouse(tag!)
        }
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        
        
        topButton = UIButton.init(type: .custom)
        self.addSubview(topButton)
        topButton.setTitle(title, for: UIControlState())
        topButton.titleLabel?.font = titleFont
        topButton.layer.masksToBounds = true
        topButton.frame = CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 2)
        topButton.setTitleColor(UIColor.init(hexString: App_Theme_FFFFFF_Color), for: .normal)
        
        if tag != nil {
            self.tag = tag!
        }
        switch type {
        case .withNoBoarder:
            self.setWithNoBoarderButton()
        case .withBoarder:
            self.setWithBoarderButton()
        case .withBackBoarder:
            self.setwithonBoarderButton()
        default:
            self.setWithDisbleBoarderButton()
        }
    }
    
    func setButtonIsEnabled(isEnabled:Bool){
        topButton.isEnabled = isEnabled
        if isEnabled {
            topButton.backgroundColor = UIColor.init(hexString: App_Theme_FB9E9F_Color, andAlpha: 1)
        }else{
            topButton.backgroundColor = UIColor.init(hexString: App_Theme_FB9E9F_Color, andAlpha: 0.7)
        }
    }
    
    func setWithNoBoarderButton(){
        topButton.buttonSetTitleColor(App_Theme_CCCCCC_Color, sTitleColor: App_Theme_6D4033_Color)
    }
    
    func setWithBoarderButton(){
        self.layer.borderColor = UIColor.init(hexString: App_Theme_F94856_Color).cgColor
        self.layer.borderWidth = 1.0
        topButton.buttonSetTitleColor(App_Theme_F94856_Color, sTitleColor: App_Theme_6D4033_Color)
    }
    
    func setWithDisbleBoarderButton(){
        self.layer.borderColor = UIColor.init(hexString: App_Theme_BBC1CB_Color).cgColor
        self.layer.borderWidth = 1.0
        topButton.buttonSetTitleColor(App_Theme_BBC1CB_Color, sTitleColor: App_Theme_BBC1CB_Color)
    }
    
    func setwithonBoarderButton(){
        topButton.setTitleColor(UIColor.white, for: UIControlState())
        topButton.buttonSetThemColor(App_Theme_FB9E9F_Color, selectColor: App_Theme_FB9E9F_Color, size: CGSize.init(width: self.frame.size.width, height: self.frame.size.height))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

typealias CustomViewButtonClickClouse = () ->Void

class CustomViewButton: UIView {
    
    var imageView:UIImageView!
    var label:UILabel!
    var customViewButtonClouse:CustomViewButtonClickClouse!
    
    //size = 34+11,34 + 14
    init(frame:CGRect, title:String, image:UIImage, tag:NSInteger?, click:@escaping TouchClickClouse) {
        super.init(frame: frame)
        self.customViewButtonClouse = click
        imageView = UIImageView.init(frame: CGRect.init(x: 11, y: 0, width: 68, height: 68))
        imageView.image = image
        self.addSubview(imageView)
        
        label = UILabel.init(frame: CGRect.init(x: 0, y: 77, width: frame.size.width, height: 20))
        label.textAlignment = .center
        label.text = title
        label.font = App_Theme_PinFan_R_14_Font
        label.textColor = UIColor.init(hexString: App_Theme_333333_Color)
        self.isUserInteractionEnabled = true
        self.tag = tag!
        self.addSubview(label)
        let singTap = UITapGestureRecognizer.init(target: self, action: #selector(self.singleTap))
        singTap.numberOfTapsRequired = 1
        singTap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(singTap)
    }
    
    @objc func singleTap(){
        if self.customViewButtonClouse != nil {
            self.customViewButtonClouse()
        }
    }
    
    
    func changeLabelText(str:String) {
        label.text = str
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustonPayTypeView: UIView {
    var imageView:UIImageView!
    var lable:UILabel!
    var isSelect:Bool!
    
    init(frame:CGRect, image:UIImage, title:String, isSelect:Bool) {
        super.init(frame: frame)
        imageView = UIImageView.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

enum GloabelShareAndConnectUsType {
    case share
    case connectUs
}

enum ClickType {
    case weChatService
    case weChatChat
    case weChatSession
    case phoneCall
    case QQService
    case QQChat
}

typealias GloabelImageAndLabelClouse = () ->Void

class GloabelImageAndLabel : AnimationTouchView {
    
    var imageView:UIImageView!
    var titleLabel:UILabel!
    var gloabelImageAndLabelClouse:GloabelImageAndLabelClouse!
    
    init(frame: CGRect,title:String, image:UIImage,clouse:@escaping GloabelImageAndLabelClouse) {
        super.init(frame: frame) {
            clouse()
        }
        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 60))
        imageView.image = image
        self.gloabelImageAndLabelClouse = clouse
        self.addSubview(imageView)
        
        titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 68, width: 60, height: 20))
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = App_Theme_PinFan_R_14_Font
        titleLabel.textColor = UIColor.init(hexString: App_Theme_333333_Color)
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

typealias  GloabelShareAndConnectUsClouse = (_ type:ClickType) ->Void

let GloabelShareAndConnectUsTag = 1000
class GloabelShareAndConnectUs: UIView {
    
    var backGroundImage:UIImageView!
    var isHaveWeChat:Bool = WXApi.isWXAppInstalled()
    var isHaveQQ:Bool = TencentOAuth.iphoneQQInstalled()
    var titleLabel:UILabel!
    var detailView = UIView.init()
    
    var lineLabel:GloabLineView!
    var gloabelShareAndConnectUsClouse:GloabelShareAndConnectUsClouse!
    
    var weChat:GloabelImageAndLabel!
    var weChatSession:GloabelImageAndLabel!
    var qq:GloabelImageAndLabel!
    
    init(type:GloabelShareAndConnectUsType,title:String?,clickClouse:@escaping GloabelShareAndConnectUsClouse) {
        super.init(frame: CGRect.init(x: 0, y: SCREENHEIGHT, width: SCREENWIDTH, height: 250))
        self.tag = GloabelShareAndConnectUsTag
        AnimationTools.shareInstance.moveAnimation(view: self, frame: CGRect.init(x: 0, y: SCREENHEIGHT - 250, width: SCREENWIDTH, height: 250), finishClouse: { ret in
            
        })
        self.tag = 120
        self.gloabelShareAndConnectUsClouse = clickClouse
        backGroundImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: 250))
        backGroundImage.image = UIImage.init(color: UIColor.init(hexString: App_Theme_FFFFFF_Color, andAlpha: 0.75), size: CGSize.init(width: SCREENWIDTH, height: 250))
        backGroundImage.blur()
        self.addSubview(backGroundImage)
        
        self.setUpNormaleView()
        
        if type == .share {
            self.setUpShareView(title:title)
        }else{
            self.setUpConnectUsView(title:title)
        }
    }
    
    func setUpNormaleView(){
        titleLabel = UILabel.init()
        titleLabel.font = App_Theme_PinFan_M_16_Font
        titleLabel.textColor = UIColor.init(hexString: App_Theme_333333_Color)
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0)
            make.top.equalTo(self.snp.top).offset(28)
        }
        
        lineLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: 0.5))
        lineLabel.setLineColor(UIColor.init(hexString: App_Theme_EEEEEE_Color))
        self.addSubview(lineLabel)
        
        let cancelButton = AnimationButton.init()
        cancelButton.setImage(UIImage.init(named: "close"), for: .normal)
        cancelButton.reactive.controlEvents(.touchUpInside).observe { (active) in
            self.removeSelf()
        }
        self.addSubview(cancelButton)
        
        cancelButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 40))
            make.centerX.equalTo(self.snp.centerX).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(-18)
        }
    }
    
    func removeSelf(){
        if weChat != nil {
            weChat.frame = CGRect.init(x: weChat.frame.origin.x, y: 0, width: 60, height: 88)
            weChat.layer.add(AnimationTools.shareInstance.setUpAnimation(244, velocity: 7.0, finish: {_ in
                
            }), forKey: "weChat")
        }
        if weChatSession != nil {
            weChatSession.frame = CGRect.init(x: weChatSession.frame.origin.x, y: 0, width: 60, height: 88)
            weChatSession.layer.add(AnimationTools.shareInstance.setUpAnimation(244, velocity: 7.0, finish: {_ in
                
            }), forKey: "weChat")
        }
        if qq != nil {
            qq.frame = CGRect.init(x: qq.frame.origin.x, y: 0, width: 60, height: 88)
            qq.layer.add(AnimationTools.shareInstance.setUpAnimation(244, velocity: 7.0, finish: {_ in
                
            }), forKey: "weChat")
        }
        
        self.frame = CGRect.init(x: 0, y: SCREENHEIGHT - 250, width: SCREENWIDTH, height: 250)
        self.layer.add(AnimationTools.shareInstance.setUpAnimation(SCREENHEIGHT + 250, velocity: 1.0, finish: {_ in
            
        }), forKey: "AnimationTools")
        _ = Timer.after(1, {
            self.removeFromSuperview()
        })
    }
    
    func setUpShareView(title:String?){
        titleLabel.text = title!
        var maxX:CGFloat = 0
        if isHaveWeChat {
            weChat = GloabelImageAndLabel.init(frame: CGRect.init(x: maxX, y: 90, width: 60, height: 88), title: "微信", image: UIImage.init(named: "wechat")!){
                self.gloabelShareAndConnectUsClouse(.weChatChat)
                self.removeSelf()
            }
            _ = Timer.after(0.8, {
                self.weChat.frame = CGRect.init(x: self.weChat.frame.origin.x, y: 0, width: 60, height: 88)
            })
            weChat.layer.add(AnimationTools.shareInstance.setUpAnimation(44, velocity: 8.0, finish: {_ in
            }), forKey: "weChat")
            maxX = weChat.frame.maxX + 45
            detailView.addSubview(weChat)
            
            
            weChatSession = GloabelImageAndLabel.init(frame: CGRect.init(x: maxX, y: 90, width: 60, height: 88), title: "朋友圈", image: UIImage.init(named: "friends")!){
                self.gloabelShareAndConnectUsClouse(.weChatSession)
                self.removeSelf()
            }
            _ = Timer.after(0.8, {
                self.weChatSession.frame = CGRect.init(x: self.weChatSession.frame.origin.x, y: 0, width: 60, height: 88)
            })
            weChatSession.layer.add(AnimationTools.shareInstance.setUpAnimation(44, velocity: 6.0, finish: {_ in

            }), forKey: "weChatSession")
            maxX = weChatSession.frame.maxX + 45
            detailView.addSubview(weChatSession)
            
        }
        
        if isHaveQQ {
            
            qq = GloabelImageAndLabel.init(frame: CGRect.init(x: maxX, y: 90, width: 60, height: 88), title: "QQ", image: UIImage.init(named: "QQ")!){
                self.gloabelShareAndConnectUsClouse(.QQChat)
                self.removeSelf()
            }
            
            _ = Timer.after(0.8, {
                self.qq.frame = CGRect.init(x: self.qq.frame.origin.x, y: 0, width: 60, height: 88)
            })
            
            qq.layer.add(AnimationTools.shareInstance.setUpAnimation(44, velocity: 2.0, finish: {_ in

            }), forKey: "qq")
            maxX = qq.frame.maxX + 45
            detailView.addSubview(qq)
            
        }
        detailView.frame = CGRect.init(x: (SCREENWIDTH - maxX + 45)/2, y: 74, width: maxX - 45, height: 88)
        self.addSubview(detailView)
    }
    
    func setUpConnectUsView(title:String?){
        titleLabel.text = title!
        var maxX:CGFloat = 0
        if isHaveWeChat {
            let weChat = GloabelImageAndLabel.init(frame: CGRect.init(x: maxX, y: 0, width: 60, height: 88), title: "客服微信", image: UIImage.init(named: "wechat")!){
                self.gloabelShareAndConnectUsClouse(.weChatService)
                self.removeSelf()
            }
            detailView.addSubview(weChat)
            maxX = weChat.frame.maxX + 45
        }
        let phoneCall = GloabelImageAndLabel.init(frame: CGRect.init(x: maxX, y: 0, width: 60, height: 88), title: "客服电话", image: UIImage.init(named: "contact_about")!){
            self.gloabelShareAndConnectUsClouse(.phoneCall)
            self.removeSelf()
        }
        detailView.addSubview(phoneCall)
        maxX = phoneCall.frame.maxX + 45
        
        if isHaveQQ {
            let qq = GloabelImageAndLabel.init(frame: CGRect.init(x: maxX, y: 0, width: 60, height: 88), title: "客服QQ", image: UIImage.init(named: "QQ")!){
                self.gloabelShareAndConnectUsClouse(.QQService)
                self.removeSelf()
            }
            detailView.addSubview(qq)
            maxX = qq.frame.maxX + 45
        }
        detailView.frame = CGRect.init(x: (SCREENWIDTH - maxX + 45)/2, y: 74, width: maxX - 45, height: 88)
        self.addSubview(detailView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

typealias GloableBottomViewClouse = () ->Void
class GloableBottomView: UIView {
    var label:UILabel!
    var gloableBottomViewClouse:GloableBottomViewClouse!
    
    init(frame: CGRect, title:String, click:@escaping GloableBottomViewClouse) {
        super.init(frame: frame)
        self.gloableBottomViewClouse = click
        let singleTap = UITapGestureRecognizer.init(target: self, action: #selector(self.singleTap))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        self.addGestureRecognizer(singleTap)
        
        label = UILabel.init()
        label.backgroundColor = UIColor.init(hexString: App_Theme_FC4652_Color)
        label.text = title
        label.textAlignment = .center
        label.font = App_Theme_PinFan_R_20_Font
        label.textColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(0)
            make.right.equalTo(self.snp.right).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(0)
            make.top.equalTo(self.snp.top).offset(0)
        }
    }
    
    @objc func singleTap() {
        if self.gloableBottomViewClouse != nil {
            self.gloableBottomViewClouse()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

