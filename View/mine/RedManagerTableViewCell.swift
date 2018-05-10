//
//  RedManagerTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class RedManagerTableViewCell: UITableViewCell {

    var titleLabel:UILabel!
    var dateLabel:UILabel!
    var coinsLabel:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        titleLabel = UILabel.init()
        titleLabel.text = "20元支付宝红包"
        titleLabel.setUpLabel(App_Theme_PinFan_R_22_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(titleLabel)
        
        dateLabel = UILabel.init()
        dateLabel.text = "兑换时间：2018-04-02"
        dateLabel.setUpLabel(App_Theme_PinFan_R_22_Font, UIColor.init(hexString: App_Theme_A0A0A0_Color))
        self.contentView.addSubview(dateLabel)
        
        coinsLabel = UILabel.init()
        coinsLabel.text = "消耗金币20"
        coinsLabel.setUpLabel(App_Theme_PinFan_R_22_Font, UIColor.init(hexString: App_Theme_A0A0A0_Color))
        self.contentView.addSubview(coinsLabel)
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(37.3)
                make.centerY.equalTo(self.contentView.snp.centerY).offset(-7)
            }
            dateLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(37.5)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
            }
            coinsLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.dateLabel.snp.right).offset(33)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
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
