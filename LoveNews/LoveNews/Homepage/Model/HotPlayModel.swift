//
//  MovieModel.swift
//  LoveNews
//
//  Created by yingz on 2018/4/23.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import ObjectMapper



class HotPlayModel: Mappable {
    
    
    var totalCinemaCount:NSNumber = 0
    var count :NSNumber = 0
    var movies: [movieModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        totalCinemaCount <- map["totalCinemaCount"]
        count <- map["count"]
        movies <- map["movies"]
        
    }
}



class movieModel: Mappable {
    
    
    var totalCinemaCount:NSNumber = 0
    var count :NSNumber = 0
    var actorName1 :String?
    var actorName2 :String?
    var commonSpecial:String?
    var directorName:String?
    var img:String = ""
    var is3D:Bool = true
    var isIMAX:Bool = true
    var titleCn:String?
    var titleEn:String?
    var type:String?
    var wantedCount:NSNumber = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        actorName1 <- map["actorName1"]
        actorName2 <- map["actorName2"]
        commonSpecial <- map["commonSpecial"]
        directorName <- map["directorName"]
        img <- map["img"]
        is3D <- map["is3D"]
        isIMAX <- map["isIMAX"]
        titleCn <- map["titleCn"]
        titleEn <- map["titleEn"]
        type <- map["type"]
        wantedCount <- map["wantedCount"]
        commonSpecial <- map["commonSpecial"]
        
    }
}









