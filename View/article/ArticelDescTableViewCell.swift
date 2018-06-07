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
    
    var button:AnimationButton!
    var readnumber:UILabel!
    
    var contentImageTitleView:UIView!
    
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
        
        contentImageTitleView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT * 3))
        self.contentView.addSubview(contentImageTitleView)
        
        button = AnimationButton.init(frame: CGRect.zero)
        button.setTitle("进店即可获得折扣", for: .normal)
        button.backgroundColor = UIColor.init(hexString: App_Theme_FB9E9F_Color)
        button.layer.cornerRadius = 5
        contentImageTitleView.addSubview(button)
        
        readnumber = UILabel.init()
        readnumber.numberOfLines = 0
        readnumber.setUpLabel(App_Theme_PinFan_R_10_Font, UIColor.init(hexString: App_Theme_DDE0E5_Color))
        self.contentView.addSubview(readnumber)
        
        lineLable = GloabLineView.init(frame: CGRect.zero)
        self.contentView.addSubview(lineLable)
        
        self.updateConstraints()
    }
    
    func cellsetData(model:ArticleDetailModel){

        let strs = (model.articleInfo.content! as NSString).replacingOccurrences(of: "<img>", with: "g")
        let contentStr = strs.split(separator: "g")
        var frame = CGRect.init(x: 0, y: 0, width: SCREENWIDTH - 50, height: 0)
        var strHeight:CGFloat = 0
        for i in  0...contentStr.count - 1 {
            frame.size.height = (contentStr[i] as NSString).height(with: App_Theme_PinFan_R_13_Font, constrainedToWidth: SCREENHEIGHT - 50)
            strHeight = (contentStr[i] as NSString).height(with: App_Theme_PinFan_R_13_Font, constrainedToWidth: SCREENHEIGHT - 50)
            contentImageTitleView.addSubview(self.setUpText(str: String(contentStr[i]), frame: frame))
            frame.origin.y = frame.origin.y + strHeight + 20
            frame.size.height = 100
            contentImageTitleView.addSubview(self.setUpImageView(str: model.images[i], frame: frame))
            frame.origin.y = frame.origin.y + 100
        }
        contentImageTitleView.snp.updateConstraints({ (make) in
            make.height.equalTo(frame.maxY)
        })
            
        titleLabel.text = model.articleInfo.title
        authonLabel.text = model.articleInfo.author
        dateLabel.text = model.articleInfo.publish
        readnumber.text = "\(model.articleInfo.pv!)"
        self.contentView.updateConstraintsIfNeeded()
        
        button.reactive.controlEvents(.touchUpInside).observe { (button) in
            SHARE_APPLICATION.openURL(URL.init(string: model.articleInfo.tbItemUrl)!)
        }
    }
    
    func setUpText(str:String, frame:CGRect) ->UILabel{
        let descLabel = UILabel.init(frame: frame)
        descLabel.numberOfLines = 0
        descLabel.setUpLabel(App_Theme_PinFan_R_13_Font, UIColor.init(hexString: App_Theme_A0A0A0_Color))
        descLabel.text = str
        return descLabel
    }
    
    func setUpImageView(str:String, frame:CGRect) ->UIImageView{
        let postImage = UIImageView.init(frame: frame)
        UIImageViewManger.sd_imageView(url: str, imageView: postImage, placeholderImage: nil) { (image, error, cacheType, url) in
            
        }
        return postImage
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
            
            contentImageTitleView.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.top.equalTo(self.authonLabel.snp.bottom).offset(15)
                make.right.equalTo(self.contentView.snp.right).offset(-25)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-15)
                make.height.equalTo(100)
            }
            
            button.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(25)
                make.bottom.equalTo(self.contentImageTitleView.snp.bottom).offset(-25)
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
