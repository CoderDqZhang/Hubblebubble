//
//  GoodsCollectionViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class GoodsCollectionViewCell: UICollectionViewCell {
    
    var postImage:UIImageView!
    var titleLabel:UILabel!
    var muchberLabel:UILabel!
    var buyButton:AnimationButton!
    
    var didMakeConstraints = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.init(hexString: App_Theme_F2F2F2_Color)?.cgColor
        self.setUpView()
    }
    
    func setUpView(){
        
        postImage = UIImageView.init()
        postImage.backgroundColor = UIColor.red
        self.contentView.addSubview(postImage)
        
        titleLabel = UILabel.init()
        titleLabel.text = "气质不重要，这样穿能让你职场尽显女王范"
        titleLabel.numberOfLines = 2
        titleLabel.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_333333_Color))
        self.contentView.addSubview(titleLabel)
        
        muchberLabel = UILabel.init()
        muchberLabel.text = "￥199"
        muchberLabel.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_FA4B95_Color))
        self.contentView.addSubview(muchberLabel)
        
        buyButton = AnimationButton.init(frame: CGRect.zero)
        buyButton.setTitleColor(UIColor.init(hexString: App_Theme_FFFFFF_Color), for: .normal)
        buyButton.layer.cornerRadius = 3.0
        buyButton.setTitle("立即购买", for: .normal)
        buyButton.titleLabel?.font = App_Theme_PinFan_R_13_Font
        buyButton.backgroundColor = UIColor.init(hexString: App_Theme_FB9E9F_Color)
        self.contentView.addSubview(buyButton)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            postImage.snp.makeConstraints({ (make) in
                make.top.equalTo(self.contentView.snp.top).offset(0)
                make.left.equalTo(self.contentView.snp.left).offset(5)
                make.right.equalTo(self.contentView.snp.right).offset(-5)
                make.height.equalTo(100)
            })
            
            titleLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(self.postImage.snp.bottom).offset(10)
                make.left.equalTo(self.contentView.snp.left).offset(5)
                make.right.equalTo(self.contentView.snp.right).offset(-5)
            })
            
            muchberLabel.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
                make.left.equalTo(self.contentView.snp.left).offset(5)
            })
            
            buyButton.snp.makeConstraints({ (make) in
                make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
                make.right.equalTo(self.contentView.snp.right).offset(-5)
                make.size.equalTo(CGSize.init(width: 80, height: 30))
            })
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

