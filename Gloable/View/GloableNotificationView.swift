

//
//  GloableNotificationView.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/21.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

enum GloableNotificationViewType {
    case Notification
    case GetAward
}

typealias GloableNotificationViewButtonClouse = () ->Void

class GloableNotificationView: UIView {

    var backSplashView:UIView!
    var contentView:UIView!
    var button:CustomTouchButton!
    
    var gloableNotificationViewButtonClouse:GloableNotificationViewButtonClouse!
    init(frame:CGRect, type:GloableNotificationViewType, title:String?, subTitle:String?, buttonTitle:String,gloableNotificationViewButtonClouse:@escaping GloableNotificationViewButtonClouse) {
        super.init(frame: frame)
        self.gloableNotificationViewButtonClouse = gloableNotificationViewButtonClouse
        backSplashView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT))
        backSplashView.backgroundColor = UIColor.init(hexString: App_Theme_000000_Color, andAlpha: 0.3)
        self.addSubview(backSplashView)
        self.setUpView(title: title, subTitle: subTitle, buttonTitle: buttonTitle, type: type)
        
    }
    
    func setUpView(title:String?, subTitle:String?, buttonTitle:String, type:GloableNotificationViewType) {
        contentView = UIView.init(frame: CGRect.zero)
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(30)
            make.right.equalTo(self.snp.right).offset(-30)
            make.centerY.equalTo(self.snp.centerY).offset(60)
            make.height.equalTo(SCREENHEIGHT/2)
        }
        switch type {
        case .Notification:
            self.setUpNotificationView(title: title, subTitle: subTitle, buttonTitle: buttonTitle)
        case .GetAward:
            self.setUpGetAwardView(title: title, subTitle: subTitle, buttonTitle: buttonTitle)
        default:
            break
        }
        
        let lineView = GloabLineView.init(frame: CGRect.init(x: 10, y: 0, width: 1, height: SCREENHEIGHT/2 - 240))
        self.contentView.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-20)
            make.top.equalTo(self.contentView.snp.top).offset(200)
        }
        
        let close = UIButton.init(type: .custom)
        close.setTitle("关闭", for: .normal)
        close.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.disMissView()
        }
        self.contentView.addSubview(close)
        close.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
        }
    }
    
    func setUpGetAwardView(title:String?, subTitle:String?, buttonTitle:String){
        let detailView = UIView.init()
        self.contentView.addSubview(detailView)
        detailView.backgroundColor = UIColor.white
        
        let titleLabel = UILabel.init()
        titleLabel.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_000000_Color))
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        detailView.addSubview(titleLabel)
        
        self.button = CustomTouchButton.init(frame: CGRect.init(x: ((SCREENWIDTH - 60) - 120)/2, y: 120, width: 120, height: 40), title: buttonTitle, tag: 0, titleFont: App_Theme_PinFan_R_15_Font, type: CustomButtonType.withBackBoarder, pressClouse: { (tag) in
            self.disMissView()
            self.gloableNotificationViewButtonClouse()
        })
        detailView.addSubview(self.button)
        
        detailView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(detailView.snp.top).offset(10)
        }
        
        self.button.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.bottom.equalTo(detailView.snp.bottom).offset(10)
        }
        
    }
    
    func setUpNotificationView(title:String?, subTitle:String?, buttonTitle:String){
        let detailView = UIView.init()
        self.contentView.addSubview(detailView)
        detailView.backgroundColor = UIColor.white
        
        let titleLabel = UILabel.init()
        titleLabel.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_000000_Color))
        titleLabel.text = title
        detailView.addSubview(titleLabel)
        
        let subTitleLabel = UILabel.init()
        subTitleLabel.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        subTitleLabel.numberOfLines = 0
        subTitleLabel.text = subTitle
        detailView.addSubview(subTitleLabel)
        
        self.button = CustomTouchButton.init(frame: CGRect.init(x: ((SCREENWIDTH - 60) - 120)/2, y: 140, width: 120, height: 40), title: buttonTitle, tag: 0, titleFont: App_Theme_PinFan_R_15_Font, type: CustomButtonType.withBackBoarder, pressClouse: { (tag) in
            self.disMissView()
            self.gloableNotificationViewButtonClouse()
        })
    
        detailView.addSubview(self.button)
        
        detailView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(detailView.snp.top).offset(20)
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(detailView.snp.left).offset(10)
            make.right.equalTo(detailView.snp.right).offset(-10)
        }
        
    }
    
    func disMissView(){
        self.removeFromSuperview()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
