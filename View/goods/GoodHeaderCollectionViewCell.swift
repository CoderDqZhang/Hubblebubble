//
//  GoodHeaderCollectionViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class GoodHeaderCollectionViewCell: UICollectionViewCell {
    
    var postImage:UIImageView!
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
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        if !didMakeConstraints {
            postImage.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.top.equalToSuperview()
            }
            
            didMakeConstraints = true
        }
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
