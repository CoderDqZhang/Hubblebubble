//
//  ArticelDescTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/11.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticelDescTableViewCell: UITableViewCell {

    var titleLabel:UILabel!
    var authonLabel:UILabel!
    var dateLabel:UILabel!
    var descLabel:UILabel!
    var postImage:UIImageView!
    
    var button:AnimationButton!
    var readnumber:UILabel!
    
    var lineLable:GloabLineView!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        titleLabel = UILabel.init()
        titleLabel.numberOfLines = 0
        titleLabel.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_A0A0A0_Color))
        self.contentView.addSubview(titleLabel)
        
        authonLabel = UILabel.init()
        authonLabel.numberOfLines = 0
        authonLabel.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.contentView.addSubview(authonLabel)
        
        dateLabel = UILabel.init()
        dateLabel.numberOfLines = 0
        dateLabel.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.contentView.addSubview(dateLabel)
        
        descLabel = UILabel.init()
        descLabel.numberOfLines = 0
        descLabel.setUpLabel(App_Theme_PinFan_R_13_Font, UIColor.init(hexString: App_Theme_A0A0A0_Color))
        self.contentView.addSubview(descLabel)
        
        postImage = UIImageView.init()
        self.contentView.addSubview(postImage)
        
        button = AnimationButton.init(frame: CGRect.zero)
        button.setTitle("进店即可获得折扣", for: .normal)
        button.backgroundColor = UIColor.init(hexString: App_Theme_FB9E9F_Color)
        button.layer.cornerRadius = 5
        
        self.contentView.addSubview(button)
        
        readnumber = UILabel.init()
        readnumber.numberOfLines = 0
        readnumber.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.contentView.addSubview(readnumber)
        
        lineLable = GloabLineView.init(frame: CGRect.zero)
        self.contentView.addSubview(lineLable)
        
        self.updateConstraints()
    }
    
    func setData(title:String, desc:String, authon:String, date:String, image:UIImage, red:String){
        titleLabel.text = title
        authonLabel.text = authon
        dateLabel.text = date
        descLabel.text = desc
        postImage.image = image
        readnumber.text = red
        self.contentView.updateConstraintsIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.contentView.snp.top).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
            }
            authonLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
            }
            dateLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.authonLabel.snp.right).offset(25)
                make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            }
            descLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.authonLabel.snp.bottom).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
            }
            postImage.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.descLabel.snp.bottom).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
            }
            button.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.postImage.snp.bottom).offset(15)
                make.height.equalTo(59)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
            }
            readnumber.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.button.snp.bottom).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
            }
            lineLable.snp.makeConstraints { (make) in
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
