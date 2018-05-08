//
//  ReCommendTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ReCommendTableViewCell: UITableViewCell {

    var didMakeConstraints = false
    
    var postImage:UIImageView!
    var title:UILabel!
    var readDesc:UILabel!
    var readNumber:UILabel!
    var dateLabel:UILabel!
    var lineLabel:GloabLineView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        postImage = UIImageView.init()
        postImage.backgroundColor = UIColor.red
        self.contentView.addSubview(postImage)
        
        title = UILabel.init()
        title.text = "气质不重要，这样穿能让你职场尽显女王范"
        title.numberOfLines = 0
        title.setUpLabel(App_Theme_PinFan_R_14_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(title)
        
        readDesc = UILabel.init()
        readDesc.text = "阅读量"
        readDesc.setUpLabel(App_Theme_PinFan_R_12_Font, UIColor.init(hexString: App_Theme_ABACAE_Color))
        self.contentView.addSubview(readDesc)
        
        readNumber = UILabel.init()
        readNumber.text = "21089"
        readNumber.setUpLabel(App_Theme_PinFan_R_12_Font, UIColor.init(hexString: App_Theme_FB0B89_Color))
        self.contentView.addSubview(readNumber)
        
        dateLabel = UILabel.init()
        dateLabel.text = "日期：2018-08-09"
        dateLabel.setUpLabel(App_Theme_PinFan_R_11_Font, UIColor.init(hexString: App_Theme_CACBCC_Color))
        self.contentView.addSubview(dateLabel)
        
        lineLabel = GloabLineView.init(frame: CGRect.init(x: 0, y: 84.5, width: SCREENWIDTH, height: 0.5))
        self.contentView.addSubview(lineLabel)
        
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        if !didMakeConstraints {
            postImage.snp.makeConstraints { (make) in
                make.left.equalTo(self.contentView.snp.left).offset(20)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize.init(width: 60, height: 60))
            }
            title.snp.makeConstraints { (make) in
                make.left.equalTo(postImage.snp.right).offset(20)
                make.top.equalTo(self.contentView.snp.top).offset(10)
                make.right.equalTo(self.contentView.snp.right).offset(-10)
            }
            readDesc.snp.makeConstraints { (make) in
                make.left.equalTo(postImage.snp.right).offset(20)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
            }
            readNumber.snp.makeConstraints { (make) in
                make.left.equalTo(readDesc.snp.right).offset(10)
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
            }
            dateLabel.snp.makeConstraints { (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
                make.right.equalTo(self.contentView.snp.right).offset(-10)
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
