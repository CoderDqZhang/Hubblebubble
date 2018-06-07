//
//  GuideViewController.swift
//  CatchMe
//
//  Created by Zhang on 17/01/2018.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class GuideViewController: BaseViewController {

    var scrollView:UIScrollView!
    var model:MoodModel!
    var images = ["引导页"]
    var selectMood = NSMutableArray.init()
    var moodView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.requestData()
        self.requestMoodData()
        self.setUpMoodView()
        // Do any additional setup after loading the view.
    }
    
    override func setUpView() {
        self.view.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT))
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.backgroundColor = UIColor.init(hexString: App_Theme_FFFFFF_Color)
        scrollView.contentSize = CGSize.init(width: SCREENWIDTH * 3, height: SCREENHEIGHT)
        scrollView.delegate = self
        let i = 0
        let image = UIImage.init(named: images[i])
        let imageView = UIImageView.init()
        imageView.image = image
        if SCREENHEIGHT / SCREENWIDTH < (image?.size.height)! / (image?.size.width)! {
            imageView.frame = CGRect.init(x: SCREENWIDTH * CGFloat(i) + (SCREENWIDTH - SCREENHEIGHT * (image?.size.width)! / (image?.size.height)!) / 2, y: 0, width: SCREENHEIGHT * (image?.size.width)! / (image?.size.height)!, height: SCREENHEIGHT)
        }else{
            imageView.frame = CGRect.init(x: SCREENWIDTH * CGFloat(i), y: (SCREENHEIGHT - SCREENWIDTH * (image?.size.height)! / (image?.size.width)!) / 2, width: SCREENWIDTH, height: SCREENWIDTH * (image?.size.height)! / (image?.size.width)!)
        }
        
        scrollView.addSubview(imageView)
        self.setUpPlayMusic()
        
        self.view.addSubview(scrollView)
    }
    
    func setUpPlayMusic(){
        let preImage = UIButton.init(type: UIButtonType.custom)
        let pre = UIImage.init(named: "组2拷贝2")
        preImage.frame = CGRect.init(x: SCREENWIDTH + 30, y: (SCREENHEIGHT - (pre?.size.height)!)/2, width: (pre?.size.width)!, height: (pre?.size.height)!)
        preImage.setImage(pre, for: .normal)
        self.scrollView.addSubview(preImage)
        
        let next = UIImage.init(named: "组2拷贝")
        let nextImage = UIButton.init(type: UIButtonType.custom)
        nextImage.frame = CGRect.init(x: SCREENWIDTH * 2 - 30 - (next?.size.width)!, y: (SCREENHEIGHT - (next?.size.height)!) / 2 , width: (next?.size.width)!, height: (next?.size.height)!)
        nextImage.setImage(next, for: .normal)
        self.scrollView.addSubview(nextImage)
        
        let play = UIImage.init(named: "组1")
        let playImage = UIButton.init(type: UIButtonType.custom)
        playImage.frame = CGRect.init(x: (SCREENWIDTH - (play?.size.width)!) / 2 + SCREENWIDTH, y: (SCREENHEIGHT - (play?.size.height)!)/2, width: (play?.size.width)!, height: (play?.size.height)!)
        playImage.setImage(play, for: .normal)
        self.scrollView.addSubview(playImage)
        
        let goto = UIImage.init(named: "组3")
        let gotoImage = UIButton.init(type: UIButtonType.custom)
        gotoImage.frame = CGRect.init(x: SCREENWIDTH * 2 - 30 - (goto?.size.width)!, y: 60, width: (goto?.size.width)!, height: (goto?.size.height)!)
        gotoImage.setImage(goto, for: .normal)
        gotoImage.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.disMissView()
        }
        self.scrollView.addSubview(gotoImage)
        
    }
    
    func setUpMoodView(model:MoodModel){
        let descLabel = UILabel.init()
        descLabel.text = "选择你的心情"
        descLabel.frame  = CGRect.init(x: SCREENWIDTH * 2 + 15, y: 100, width: 100, height: 16)
        descLabel.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_000000_Color))
        self.scrollView.addSubview(descLabel)
        
        var str:[String] = []
        for model in model.moodList {
            str.append(model.name)
        }
        let tzoneView = TagView.init(frame: CGRect.init(x: SCREENWIDTH * 2, y: 100, width: SCREENWIDTH, height: SCREENHEIGHT - 300), model: self.model, isImage: true, clouse: { (tag,name) in
            var ret = false
            for str in self.selectMood {
                if model.moodList[tag].name == str as! String {
                    ret = true
                }
            }
            if ret == false
            {
                self.selectMood.add(name)
            }
            self.updateSelectMood(list: self.selectMood)
        })
        self.scrollView.addSubview(tzoneView)
        
        let button = AnimationButton.init(frame: CGRect.zero)
        button.setTitle("提交心情", for: .normal)
        button.backgroundColor = UIColor.init(hexString: App_Theme_FB9E9F_Color)
        button.layer.cornerRadius = 5
        button.reactive.controlEvents(.touchUpInside).observe { (button) in
            self.subMood()
        }
        button.frame = CGRect.init(x: SCREENWIDTH * 2 + 15, y: SCREENHEIGHT - 100, width: SCREENWIDTH - 30, height: 50)
        self.scrollView.addSubview(button)
    }
    
    func updateSelectMood(list:NSMutableArray){
        self.moodView.removeSubviews()
        for i in 0...list.count - 1 {
            
            let frame = CGRect.init(x: CGFloat(i * 150), y: 0, width: 150, height: 50)
            let label = UILabel.init()
            label.frame = frame
            label.text = list[i] as! String
            label.setUpLabel(App_Theme_PinFan_R_15_Font, UIColor.init(hexString: App_Theme_FB9E9F_Color))
            self.moodView.addSubview(label)
            
        }
    }
    
    func setUpMoodView(){
        self.moodView = UIView.init()
        self.moodView.frame = CGRect.init(x: 105 + SCREENWIDTH * 2, y: 100, width: SCREENWIDTH - 115, height: 20)
        self.scrollView.addSubview(self.moodView)
    }
    
    @objc func disMissView(){
        KWINDOWDS().rootViewController = MainTabBarController()
    }
    
    func requestData(){
        let url = "\(ROOT_URL)\(START_AUDIO_URL)"
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted{
                AudioPlayManager.shareInstance.playBgMusic(name: (((resultDic.value! as! NSDictionary).object(forKey: "cur_audio")! as! NSDictionary).object(forKey: "audio_url")! as! NSString) as String)
                print(resultDic.value!)
            }
        }
    }
    
    func requestMoodData(){
        let url = "\(ROOT_URL)\(START_MOOD_LIST)"
        var parameters:AnyObject? = nil
        if UserInfoModel.isLoggedIn() {
            parameters = ["user_id":UserInfoModel.shareInstance.user_id] as AnyObject
        }
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: parameters).observe { (resultDic) in
            if !resultDic.isCompleted{
                self.model = MoodModel.init(fromDictionary: resultDic.value as! NSDictionary)
                self.setUpMoodView(model: self.model)
            }
        }
    }
    
    func subMood(){
        let url = "\(ROOT_URL)\(START_TODAY_MOOD)"
        if self.selectMood.count == 0 {
            self.disMissView()
            return
        }
        var parameters:AnyObject? = nil
        if UserInfoModel.isLoggedIn() {
            parameters = ["user_id":UserInfoModel.shareInstance.user_id,"mood_id":self.selectMood[self.selectMood.count - 1]] as AnyObject
        }
        BaseNetWorke.sharedInstance.postUrlWithString(url, parameters: nil).observe { (resultDic) in
            if !resultDic.isCompleted{
                self.disMissView()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension GuideViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
