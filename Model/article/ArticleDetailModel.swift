//
//  ArticleDetailModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/6/4.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticleDetailModel : NSObject, NSCoding{
    
    var articleInfo : ArticleInfo!
    var images : [String]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        if let articleInfoData = dictionary["article_info"] as? NSDictionary{
            articleInfo = ArticleInfo(fromDictionary: articleInfoData)
        }
        images = dictionary["images"] as? [String]
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if articleInfo != nil{
            dictionary["article_info"] = articleInfo.toDictionary()
        }
        if images != nil{
            dictionary["images"] = images
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        articleInfo = aDecoder.decodeObject(forKey: "article_info") as? ArticleInfo
        images = aDecoder.decodeObject(forKey: "images") as? [String]
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if articleInfo != nil{
            aCoder.encode(articleInfo, forKey: "article_info")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        
    }
    
}
