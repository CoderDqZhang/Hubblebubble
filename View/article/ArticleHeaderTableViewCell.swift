//
//  ArticleHeaderTableViewCell.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/8.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

typealias CyCleScrollerViewClouse = (_ index:Int) -> Void


class ArticleHeaderTableViewCell: UITableViewCell {

    var cycleScrollView:SDCycleScrollView!
    var cyCleScrollerViewClouse:CyCleScrollerViewClouse!
    
    var didMakeConstraints = false
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpView()
    }
    
    func setUpView(){
        if cycleScrollView == nil {
            cycleScrollView = SDCycleScrollView(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: IPHONEWIDTH320 ? 137 : IPHONEWIDTH375 ? 160 : 180), delegate: self, placeholderImage: nil)
            cycleScrollView.pageDotImage = UIImage.init(named: "banner_normal")
            cycleScrollView.currentPageDotImage = UIImage.init(named: "banner_select")
            cycleScrollView.currentPageDotColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
            cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
            cycleScrollView.pageControlDotSize = CGSize(width: 12, height: 12)
            self.addSubview(cycleScrollView)
            //         --- 轮播时间间隔，默认1.0秒，可自定义
            cycleScrollView.autoScroll = true
        }
    }
    
    func cellSetData(model:ArticleCategory){
        var imageList:[AnyObject] = []
        for model in model.bannerList {
            imageList.append(model.img as AnyObject)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
            self.cycleScrollView.imageURLStringsGroup = imageList as [AnyObject]
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

extension ArticleHeaderTableViewCell : SDCycleScrollViewDelegate {
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        
    }
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        if self.cyCleScrollerViewClouse != nil {
            self.cyCleScrollerViewClouse(index)
        }
    }
}
