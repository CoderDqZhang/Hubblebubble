//
//  ArticleCategoryTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/31.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticleCategoryTableViewCell: UITableViewCell {

    var didMakeConstraints = false
    
    var postImage:UIImageView!
    var title:UILabel!
    var readDesc:UIImageView!
    var readNumber:UILabel!
    var dateLabel:UILabel!
    
    var bottomView:UIView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        postImage = UIImageView.init()
        postImage.backgroundColor = UIColor.red
        self.contentView.addSubview(postImage)
        
        bottomView = UIView.init()
        bottomView.backgroundColor = UIColor.init(white: 0, alpha: 0.6)
        self.contentView.addSubview(bottomView)
        
        title = UILabel.init()
        title.text = "气质不重要，这样穿能让你职场尽显女王范"
        title.numberOfLines = 0
        title.setUpLabel(App_Theme_PinFan_R_11_Font, UIColor.init(hexString: App_Theme_FFFFFF_Color))
        bottomView.addSubview(title)
        
        readDesc = UIImageView.init()
        readDesc.backgroundColor = UIColor.red
        bottomView.addSubview(readDesc)
        
        readNumber = UILabel.init()
        readNumber.text = "21089"
        readNumber.setUpLabel(App_Theme_PinFan_R_9_Font, UIColor.init(hexString: App_Theme_FB0B89_Color))
        bottomView.addSubview(readNumber)
        
        dateLabel = UILabel.init()
        dateLabel.text = "日期：2018-08-09"
        dateLabel.setUpLabel(App_Theme_PinFan_R_11_Font, UIColor.init(hexString: App_Theme_FFFFFF_Color))
        self.contentView.addSubview(dateLabel)
        
        self.updateConstraints()
    }
    
    func cellSetData(_ model:Recommod){
        UIImageViewManger.sd_imageView(url: model.cover, imageView: self.postImage, placeholderImage: nil) { (image, error, cacheType, url) in
            
        }
        title.text = model.title
        readNumber.text = "\(model.pv!)"
        dateLabel.text = "\(model.publish!)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            postImage.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.top.equalTo(self.contentView.snp.top).offset(5)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(0)
            }
            
            bottomView.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.height.equalTo(40)
                make.bottom.equalToSuperview()
            }
            
            title.snp.makeConstraints { (make) in
                make.left.equalTo(bottomView.snp.left).offset(10)
                make.top.equalTo(bottomView.snp.top).offset(5)
                make.right.equalTo(bottomView.snp.right).offset(-10)
            }
            
            readDesc.snp.makeConstraints { (make) in
                make.left.equalTo(postImage.snp.right).offset(20)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
            }
            readNumber.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalTo(bottomView.snp.right).offset(-10)
            }
            
            dateLabel.snp.makeConstraints { (make) in
                make.left.equalTo(bottomView.snp.left).offset(10)
                make.bottom.equalTo(bottomView.snp.bottom).offset(-5)
                make.right.equalTo(bottomView.snp.right).offset(-10)
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

