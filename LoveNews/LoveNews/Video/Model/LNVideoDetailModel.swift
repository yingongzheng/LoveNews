//
//  LNVideoDetailModel.swift
//  LoveNews
//
//  Created by yingz on 2018/5/7.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import ObjectMapper


class LNVideoDetailModel: Mappable {
    
    var data :LNVideoDetailDataModel?
   
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        data <- map["data"]
        
    }
}

class LNVideoDetailDataModel: Mappable {
    
    var appointedImage:String?
    var description:String?
    var movie :LNVideoDetailMovieModel?
    var video: [LNVideoItmeModel]?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        video <- map["video"]
        
    }
}

class LNVideoDetailMovieModel: Mappable {
    
    var img:String?
    var name:String?
    var nameEn:String?
    var releaseArea:String?
    var releaseDate:String?
    var story:String?
    var wantCount:Double = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        img <- map["img"]
        name <- map["name"]
        nameEn <- map["nameEn"]
        releaseArea <- map["releaseArea"]
        releaseDate <- map["releaseDate"]
        story <- map["story"]
        wantCount <- map["wantCount"]
        
    }
}

class LNVideoItmeModel: Mappable {
    
    var hightUrl:String?
    var img:String?
    var length:Double = 0
    var title:String?
    var url:String?
    var videoId:Double = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        hightUrl <- map["hightUrl"]
        img <- map["img"]
        length <- map["length"]
        title <- map["title"]
        url <- map["url"]
        videoId <- map["videoId"]
    }
}

