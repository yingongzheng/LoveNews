//
//  LNMallListDetailModel.swift
//  LoveNews
//
//  Created by yingz on 2018/5/24.
//  Copyright © 2018年 ygz. All rights reserved.
//
import UIKit
import ObjectMapper

class LNMallListDetailModel: Mappable {
    
    var goodsList: [LNMallItemModel]?
    var count:Int = 0
    var pageCount:Int = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        goodsList <- map["goodsList"]
        count <- map["count"]
        pageCount <- map["pageCount"]
    }
}

class LNMallItemModel: Mappable {
    
 
    var background:String?
    var goodsId:Double = 0
    var image:String?
    var longName:String?
    var name:String?
    var iconText:String?
    var marketPrice:Double = 0
    var url:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        background <- map["background"]
        goodsId <- map["goodsId"]
        image <- map["image"]
        longName <- map["longName"]
        name <- map["name"]
        iconText <- map["iconText"]
        marketPrice <- map["marketPrice"]
        url <- map["url"]
    }
}
