//
//  CategoryGoods.swift
//  Hubblebubble
//
//  Created by Zhang on 2018/5/31.
//  Copyright © 2018 Zhang. All rights reserved.
//

import UIKit

class GoodsModel : NSObject, NSCoding{
    
    var bannerList : [BannerList]!
    var categoryList : [CategoryGoods]!
    var code : String!
    var itemList : [ItemList]!
    var totalPage : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        bannerList = [BannerList]()
        if let bannerListArray = dictionary["banner_list"] as? [NSDictionary]{
            for dic in bannerListArray{
                let value = BannerList(fromDictionary: dic)
                bannerList.append(value)
            }
        }
        categoryList = [CategoryGoods]()
        if let categoryListArray = dictionary["category_list"] as? [NSDictionary]{
            for dic in categoryListArray{
                let value = CategoryGoods(fromDictionary: dic)
                categoryList.append(value)
            }
        }
        code = dictionary["code"] as? String
        itemList = [ItemList]()
        if let itemListArray = dictionary["item_list"] as? [NSDictionary]{
            for dic in itemListArray{
                let value = ItemList(fromDictionary: dic)
                itemList.append(value)
            }
        }
        totalPage = dictionary["total_page"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if bannerList != nil{
            var dictionaryElements = [NSDictionary]()
            for bannerListElement in bannerList {
                dictionaryElements.append(bannerListElement.toDictionary())
            }
            dictionary["banner_list"] = dictionaryElements
        }
        if categoryList != nil{
            var dictionaryElements = [NSDictionary]()
            for categoryListElement in categoryList {
                dictionaryElements.append(categoryListElement.toDictionary())
            }
            dictionary["category_list"] = dictionaryElements
        }
        if code != nil{
            dictionary["code"] = code
        }
        if itemList != nil{
            var dictionaryElements = [NSDictionary]()
            for itemListElement in itemList {
                dictionaryElements.append(itemListElement.toDictionary())
            }
            dictionary["item_list"] = dictionaryElements
        }
        if totalPage != nil{
            dictionary["total_page"] = totalPage
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        bannerList = aDecoder.decodeObject(forKey: "banner_list") as? [BannerList]
        categoryList = aDecoder.decodeObject(forKey: "category_list") as? [CategoryGoods]
        code = aDecoder.decodeObject(forKey: "code") as? String
        itemList = aDecoder.decodeObject(forKey: "item_list") as? [ItemList]
        totalPage = aDecoder.decodeObject(forKey: "total_page") as? Int
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if bannerList != nil{
            aCoder.encode(bannerList, forKey: "banner_list")
        }
        if categoryList != nil{
            aCoder.encode(categoryList, forKey: "category_list")
        }
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if itemList != nil{
            aCoder.encode(itemList, forKey: "item_list")
        }
        if totalPage != nil{
            aCoder.encode(totalPage, forKey: "total_page")
        }
        
    }
    
}

class ItemList : NSObject, NSCoding{
    
    var cover : String!
    var price : String!
    var tbItemUrl : String!
    var title : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        cover = dictionary["cover"] as? String
        price = dictionary["price"] as? String
        tbItemUrl = dictionary["tb_item_url"] as? String
        title = dictionary["title"] as? String
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
        if price != nil{
            dictionary["price"] = price
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
        cover = aDecoder.decodeObject(forKey: "cover") as? String
        price = aDecoder.decodeObject(forKey: "price") as? String
        tbItemUrl = aDecoder.decodeObject(forKey: "tb_item_url") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        
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
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if tbItemUrl != nil{
            aCoder.encode(tbItemUrl, forKey: "tb_item_url")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        
    }
    
}

class CategoryGoods: NSObject, NSCoding{
    
    var id : Int!
    var name : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        id = dictionary["id"] as? Int
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
        id = aDecoder.decodeObject(forKey: "id") as? Int
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
