//
//  MoodModel.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/6/5.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class MoodModel : NSObject, NSCoding{
    
    var code : Int!
    var moodList : [MoodList]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        code = dictionary["code"] as? Int
        moodList = [MoodList]()
        if let moodListArray = dictionary["mood_list"] as? [NSDictionary]{
            for dic in moodListArray{
                let value = MoodList(fromDictionary: dic)
                moodList.append(value)
            }
        }
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if code != nil{
            dictionary["code"] = code
        }
        if moodList != nil{
            var dictionaryElements = [NSDictionary]()
            for moodListElement in moodList {
                dictionaryElements.append(moodListElement.toDictionary())
            }
            dictionary["mood_list"] = dictionaryElements
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? Int
        moodList = aDecoder.decodeObject(forKey: "mood_list") as? [MoodList]
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if moodList != nil{
            aCoder.encode(moodList, forKey: "mood_list")
        }
        
    }
    
}

class MoodList : NSObject, NSCoding{
    
    var id : String!
    var name : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        id = dictionary["id"] as? String
        name = dictionary["name"] as? String
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
        if name != nil{
            dictionary["name"] = name
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
        name = aDecoder.decodeObject(forKey: "name") as? String
        
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
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        
    }
    
}
