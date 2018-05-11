
//
//  CommondTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class CommondTableViewCell: UITableViewCell {

    var avatarImage:UIImageView!
    var userName:UILabel!
    var contentLabel:UILabel!
    
    var lineLabel:GloabLineView!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        avatarImage = UIImageView.init()
        avatarImage.layer.cornerRadius = 12.5
        avatarImage.backgroundColor = UIColor.red
        avatarImage.layer.masksToBounds = true
        self.contentView.addSubview(avatarImage)
        
        userName = UILabel.init()
        userName.setUpLabel(App_Theme_PinFan_R_13_Font, UIColor.init(hexString: App_Theme_A0A0A0_Color))
        self.contentView.addSubview(userName)
        
        contentLabel = UILabel.init()
        contentLabel.setUpLabel(App_Theme_PinFan_R_13_Font, UIColor.init(hexString: App_Theme_A0A0A0_Color))
        self.contentView.addSubview(contentLabel)
        
        lineLabel = GloabLineView.init(frame: CGRect.zero)
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(username:String, image:UIImage, content:String){
        avatarImage.image = image
        userName.text = username
        contentLabel.text = content
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            avatarImage.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.contentView.snp.top).offset(5)
                make.size.equalTo(CGSize.init(width: 25, height: 25))
            }
            
            userName.snp.makeConstraints { (make) in
                make.left.equalTo(self.avatarImage.snp.right).offset(7)
                make.top.equalTo(self.contentView.snp.top).offset(16)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
            }
            
            contentLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.avatarImage.snp.right).offset(7)
                make.top.equalTo(self.userName.snp.bottom).offset(12)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-30)
            }
            lineLabel.snp.makeConstraints { (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-0.5)
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(0.5)
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
