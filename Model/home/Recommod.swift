//
//  Recommod.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/31.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class Recommod : NSObject, NSCoding{
    
    var cover : String!
    var publish : String!
    var title : String!
    var id : String!
    var pv : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        cover = dictionary["cover"] as? String
        publish = dictionary["publish"] as? String
        title = dictionary["title"] as? String
        id = dictionary["id"] as? String
        pv = dictionary["pv"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if cover != nil{
            dictionary["cover"] = cover
        }
        if publish != nil{
            dictionary["publish"] = publish
        }
        if title != nil{
            dictionary["title"] = title
        }
        if id != nil{
            dictionary["id"] = id
        }
        if pv != nil{
            dictionary["pv"] = pv
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        cover = aDecoder.decodeObject(forKey: "cover") as? String
        publish = aDecoder.decodeObject(forKey: "publish") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        pv = aDecoder.decodeObject(forKey: "pv") as? String
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if cover != nil{
            aCoder.encode(cover, forKey: "cover")
        }
        if publish != nil{
            aCoder.encode(publish, forKey: "publish")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if pv != nil{
            aCoder.encode(pv, forKey: "pv")
        }
        
    }
}
