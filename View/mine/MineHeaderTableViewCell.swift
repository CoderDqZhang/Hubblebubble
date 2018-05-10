//
//  MineHeaderTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/9.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class MineUser: UIView {
    var titleLabel:UILabel!
    var descLabel:UILabel!
    
    init(frame: CGRect,title:String, desc:String) {
        super.init(frame: frame)
        titleLabel = UILabel.init()
        titleLabel.setUpLabel(App_Theme_PinFan_R_14_Font, UIColor.init(hexString: App_Theme_FFFFFF_Color))
        titleLabel.text = title
        self.addSubview(titleLabel)
        
        descLabel = UILabel.init()
        descLabel.setUpLabel(App_Theme_PinFan_R_14_Font, UIColor.init(hexString: App_Theme_FFFFFF_Color))
        descLabel.text = title
        self.addSubview(descLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0)
            make.top.equalTo(self.snp.top).offset(0)
        }
        
        descLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX).offset(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MineHeaderTableViewCell: UITableViewCell {

    var avatarImage:UIImageView!
    var userName:UILabel!
    var volumeLabel:UILabel!
    var coinsLabel:UILabel!
    var volumeLabel1:UILabel!
    var coinsLabel1:UILabel!
    var attentions:MineUser!
    var fance:MineUser!
    var friends:MineUser!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
        let att = ColorTools.changeColor(startColor: UIColor.init(hexString: App_Theme_9FC8FC_Color), endColor: UIColor.init(hexString: App_Theme_F4A0E7_Color), frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENWIDTH * 417 / 750))
        self.contentView.layer.insertSublayer(att, at: 0)
    }
    
    func setUpView(){
        avatarImage = UIImageView.init()
        avatarImage.layer.cornerRadius = 40
        avatarImage.layer.borderColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)?.cgColor
        avatarImage.layer.borderWidth = 1.0
        avatarImage.backgroundColor = UIColor.red
        self.contentView.addSubview(avatarImage)
        
        userName = UILabel.init()
        userName.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_FFFFFF_Color))
        self.contentView.addSubview(userName)
        
        volumeLabel = UILabel.init()
        volumeLabel.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_FFFFFF_Color))
        volumeLabel.text = "体积"
        self.contentView.addSubview(volumeLabel)
        
        volumeLabel1 = UILabel.init()
        volumeLabel1.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_FB9E9F_Color))
        volumeLabel1.text = "156ml"
        self.contentView.addSubview(volumeLabel1)
        
        coinsLabel = UILabel.init()
        coinsLabel.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_FFFFFF_Color))
        coinsLabel.text = "金币"
        self.contentView.addSubview(coinsLabel)
        
        coinsLabel1 = UILabel.init()
        coinsLabel1.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_FB9E9F_Color))
        coinsLabel1.text = "100"
        self.contentView.addSubview(coinsLabel1)
        
        attentions = MineUser.init(frame: CGRect.init(x: 0, y: SCREENWIDTH * 417 / 750 - 50, width: SCREENWIDTH / 3, height: 50), title: "123", desc: "关注")
        self.contentView.addSubview(attentions)
        
        fance = MineUser.init(frame: CGRect.init(x: SCREENWIDTH / 3, y: SCREENWIDTH * 417 / 750 - 50, width: SCREENWIDTH / 3, height: 50), title: "123", desc: "粉丝")
        self.contentView.addSubview(fance)
        
        friends = MineUser.init(frame: CGRect.init(x: SCREENWIDTH - SCREENWIDTH / 3, y: SCREENWIDTH * 417 / 750 - 50, width: SCREENWIDTH / 3, height: 50), title: "123", desc: "好友")
        self.contentView.addSubview(friends)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            avatarImage.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(20)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize.init(width: 80, height: 80))
            }
            
            userName.snp.makeConstraints { (make) in
                make.left.equalTo(self.avatarImage.snp.right).offset(20)
                make.top.equalTo(self.avatarImage.snp.top).offset(25)
            }
            coinsLabel1.snp.makeConstraints { (make) in
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.top.equalTo(self.avatarImage.snp.top).offset(30)
            }
            coinsLabel.snp.makeConstraints { (make) in
                make.right.equalTo(self.coinsLabel1.snp.left).offset(-5)
                make.top.equalTo(self.avatarImage.snp.top).offset(30)
            }
            volumeLabel1.snp.makeConstraints { (make) in
                make.right.equalTo(self.coinsLabel.snp.left).offset(-15)
                make.top.equalTo(self.avatarImage.snp.top).offset(30)
            }
            volumeLabel.snp.makeConstraints { (make) in
                make.right.equalTo(self.volumeLabel1.snp.left).offset(-5)
                make.top.equalTo(self.avatarImage.snp.top).offset(30)
            }
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
