//
//  ArticleCategory.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/31.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticleCategory : NSObject, NSCoding{
    
    var recommmod : [Recommod]!
    var bannerList : [BannerList]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        recommmod = [Recommod]()
        if let RecommmodArray = dictionary["article_list"] as? [NSDictionary]{
            for dic in RecommmodArray{
                let value = Recommod(fromDictionary: dic)
                recommmod.append(value)
            }
        }
        bannerList = [BannerList]()
        if let bannerListArray = dictionary["banner_list"] as? [NSDictionary]{
            for dic in bannerListArray{
                let value = BannerList(fromDictionary: dic)
                bannerList.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if recommmod != nil{
            var dictionaryElements = [NSDictionary]()
            for recommmodElement in recommmod {
                dictionaryElements.append(recommmodElement.toDictionary())
            }
            dictionary["article_list"] = dictionaryElements
        }
        if bannerList != nil{
            var dictionaryElements = [NSDictionary]()
            for bannerListElement in bannerList {
                dictionaryElements.append(bannerListElement.toDictionary())
            }
            dictionary["banner_list"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        recommmod = aDecoder.decodeObject(forKey: "article_list") as? [Recommod]
        bannerList = aDecoder.decodeObject(forKey: "banner_list") as? [BannerList]
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if recommmod != nil{
            aCoder.encode(recommmod, forKey: "article_list")
        }
        if bannerList != nil{
            aCoder.encode(bannerList, forKey: "banner_list")
        }
        
    }
    
}

class BannerList : NSObject, NSCoding{
    
    var id : String!
    var img : String!
    var type : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        id = dictionary["id"] as? String
        img = dictionary["img"] as? String
        type = dictionary["type"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if id != nil{
            dictionary["id"] = id
        }
        if img != nil{
            dictionary["img"] = img
        }
        if type != nil{
            dictionary["type"] = type
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? String
        img = aDecoder.decodeObject(forKey: "img") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if img != nil{
            aCoder.encode(img, forKey: "img")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        
    }
    
}
