//
//  FansTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class FansTableViewCell: UITableViewCell {

    var avatarImage:UIImageView!
    var userName:UILabel!
    var cloumLabel:UILabel!
    var moodLabel:UILabel!
    var lineLabel:GloabLineView!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        avatarImage = UIImageView.init()
        avatarImage.layer.cornerRadius = 20
        avatarImage.layer.masksToBounds = true
        avatarImage.backgroundColor = UIColor.red
        self.contentView.addSubview(avatarImage)
        
        userName = UILabel.init()
        userName.text = "测试数据"
        userName.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(userName)
        
        moodLabel = UILabel.init()
        moodLabel.text = "开心"
        moodLabel.setUpLabel(App_Theme_PinFan_R_13_Font, UIColor.init(hexString: App_Theme_FB9E9F_Color))
        self.contentView.addSubview(moodLabel)
        
        cloumLabel = UILabel.init()
        cloumLabel.text = "体积：156ml"
        cloumLabel.setUpLabel(App_Theme_PinFan_R_13_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.contentView.addSubview(cloumLabel)
        
        lineLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 59.5, width: SCREENWIDTH, height: 0.5))
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            avatarImage.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize.init(width: 40, height: 40))
            }
            
            userName.snp.makeConstraints { (make) in
                make.left.equalTo(self.avatarImage.snp.right).offset(15)
                make.top.equalTo(self.contentView.snp.top).offset(10)
            }
            
            moodLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.userName.snp.right).offset(20)
                make.top.equalTo(self.contentView.snp.top).offset(13)
            }
            
            cloumLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.avatarImage.snp.right).offset(15)
                make.top.equalTo(self.userName.snp.bottom).offset(10)
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
