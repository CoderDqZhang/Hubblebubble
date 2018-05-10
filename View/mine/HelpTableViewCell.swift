//
//  HelpTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HelpTableViewCell: UITableViewCell {

    var titleLabel:UILabel!
    var descLabel:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        titleLabel = UILabel.init()
        titleLabel.setUpLabel(App_Theme_PinFan_M_16_Font, UIColor.init(hexString: App_Theme_333333_Color))
        titleLabel.text = "优惠券的使用"
        self.contentView.addSubview(titleLabel)
        
        descLabel = UILabel.init()
        descLabel.setUpLabel(App_Theme_PinFan_R_12_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        descLabel.numberOfLines = 0
        descLabel.text = "2018-05-10 09:19:07.026584+0800 Hubblebubble[1031:1206412] [2][NVSOpenH264Encoder.mm][47]: openh264 version: 1.6.0.02018-05-10 09:19:07.323693+0800 Hubblebubble[1031:1206412] Unknown class ViewController in Interface Builder file."
        self.contentView.addSubview(descLabel)
        self.updateConstraints()
    }
    
    func setData(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.top.equalTo(self.contentView.snp.top).offset(15)
            }
            descLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-15)
                make.top.equalTo(titleLabel.snp.bottom).offset(10)
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
