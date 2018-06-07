//
//  ArticleInfo.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/31.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class ArticleInfo: NSObject, NSCoding{
    
    var author : String!
    var content : String!
    var cover : String!
    var id : String!
    var publish : String!
    var pv : Int!
    var tbItemUrl : String!
    var title : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        author = dictionary["author"] as? String
        content = dictionary["content"] as? String
        cover = dictionary["cover"] as? String
        id = dictionary["id"] as? String
        publish = dictionary["publish"] as? String
        pv = dictionary["pv"] as? Int
        tbItemUrl = dictionary["tb_item_url"] as? String
        title = dictionary["title"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if author != nil{
            dictionary["author"] = author
        }
        if content != nil{
            dictionary["content"] = content
        }
        if cover != nil{
            dictionary["cover"] = cover
        }
        if id != nil{
            dictionary["id"] = id
        }
        if publish != nil{
            dictionary["publish"] = publish
        }
        if pv != nil{
            dictionary["pv"] = pv
        }
        if tbItemUrl != nil{
            dictionary["tb_item_url"] = tbItemUrl
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        author = aDecoder.decodeObject(forKey: "author") as? String
        content = aDecoder.decodeObject(forKey: "content") as? String
        cover = aDecoder.decodeObject(forKey: "cover") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        publish = aDecoder.decodeObject(forKey: "publish") as? String
        pv = aDecoder.decodeObject(forKey: "pv") as? Int
        tbItemUrl = aDecoder.decodeObject(forKey: "tb_item_url") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if author != nil{
            aCoder.encode(author, forKey: "author")
        }
        if content != nil{
            aCoder.encode(content, forKey: "content")
        }
        if cover != nil{
            aCoder.encode(cover, forKey: "cover")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if publish != nil{
            aCoder.encode(publish, forKey: "publish")
        }
        if pv != nil{
            aCoder.encode(pv, forKey: "pv")
        }
        if tbItemUrl != nil{
            aCoder.encode(tbItemUrl, forKey: "tb_item_url")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        
    }
}
