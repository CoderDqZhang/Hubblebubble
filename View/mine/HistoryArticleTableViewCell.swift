//
//  HistoryArticleTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/10.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class HistoryArticleTableViewCell: UITableViewCell {

    var postImage:UIImageView!
    var titleLabel:UILabel!
    var numberRead:UILabel!
    var dateLabel:UILabel!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        postImage = UIImageView.init()
        postImage.backgroundColor = UIColor.red
        self.contentView.addSubview(postImage)
        
        titleLabel = UILabel.init()
        titleLabel.text = "气质不重要，这样穿让你职场尽显女王范"
        titleLabel.numberOfLines = 0
        titleLabel.setUpLabel(App_Theme_PinFan_R_14_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(titleLabel)
        
        
        numberRead = UILabel.init()
        numberRead.text = "阅读量1000+"
        numberRead.setUpLabel(App_Theme_PinFan_R_11_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(numberRead)
        
        dateLabel = UILabel.init()
        dateLabel.text = "日期：2018-4-2"
        dateLabel.setUpLabel(App_Theme_PinFan_R_11_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(dateLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellSetData(_ model:Recommod){
        UIImageViewManger.sd_imageView(url: model.cover, imageView: self.postImage, placeholderImage: nil) { (image, error, cacheType, url) in
            
        }
        titleLabel.text = model.title
        numberRead.text = "阅读量:\(model.pv!)"
        dateLabel.text = "日期：\(model.publish!)"
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            postImage.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize.init(width: 128, height: 80))
            }
            titleLabel.snp.makeConstraints { (make) in
                make.left.equalTo(self.postImage.snp.right).offset(10)
                make.top.equalTo(self.contentView.snp.top).offset(17.5)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
            }
            
            numberRead.snp.makeConstraints { (make) in
                make.left.equalTo(self.postImage.snp.right).offset(10)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
            }
            
            dateLabel.snp.makeConstraints { (make) in
                make.right.equalTo(self.contentView.snp.right).offset(-25)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
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
