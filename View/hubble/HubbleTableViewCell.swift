//
//  HubbleTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HubbleTableViewCell: UITableViewCell {

    var didMakeConstraints = false
    var avatarImage:UIImageView!
    var userName:UILabel!
    var volumeLabel:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        avatarImage = UIImageView.init()
        avatarImage.layer.cornerRadius = 30
        avatarImage.layer.masksToBounds = true
        avatarImage.backgroundColor = UIColor.red
        self.contentView.addSubview(avatarImage)
        
        userName = UILabel.init()
        userName.text = "我是一个测试数据"
        userName.setUpLabel(App_Theme_PinFan_R_14_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(userName)
        
        volumeLabel = UILabel.init()
        volumeLabel.text = "我是一个测试数据"
        volumeLabel.setUpLabel(App_Theme_PinFan_R_13_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(volumeLabel)
        
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
                make.size.equalTo(CGSize.init(width: 60, height: 60))
            }
            userName.snp.makeConstraints { (make) in
                make.left.equalTo(avatarImage.snp.right).offset(20)
                make.top.equalTo(self.contentView.snp.top).offset(20)
            }
            volumeLabel.snp.makeConstraints { (make) in
                make.left.equalTo(avatarImage.snp.right).offset(20)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-20)
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
