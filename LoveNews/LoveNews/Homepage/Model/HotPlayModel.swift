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
    
    var ms: [movieModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ms <- map["ms"]
        
    }
}



class movieModel: Mappable {
    
    var actors :String?
    var commonSpecial:String?
    var dN:String?
    var img:String = ""
    var is3D:Bool = true
    var isIMAX:Bool = true
    var tCn:String?
    var tEn:String?
    var movieType:String?
    var wantedCount:NSNumber = 0
    var movieId :Double = 0
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        actors <- map["actors"]
        commonSpecial <- map["commonSpecial"]
        dN <- map["dN"]
        img <- map["img"]
        is3D <- map["is3D"]
        isIMAX <- map["isIMAX"]
        tCn <- map["tCn"]
        tEn <- map["tEn"]
        movieType <- map["movieType"]
        wantedCount <- map["wantedCount"]
        movieId <- map["id"]
        
    }
}









