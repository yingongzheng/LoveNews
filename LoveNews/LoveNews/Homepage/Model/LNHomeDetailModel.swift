//
//  LNHomeDetailModel.swift
//  LoveNews
//
//  Created by yingz on 2018/5/3.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import ObjectMapper


class LNHomeDetailModel: Mappable {
    
    var data :LNHomeDetailDataModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        data <- map["data"]
        
    }
}


class LNHomeDetailDataModel: Mappable {
    
    
    var boxOffice :LNHomeBoxOfficeModel?
    var basic :LNHomeBasicModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {

        boxOffice <- map["boxOffice"]
        basic <- map["basic"]

    }
}


class LNHomeBasicModel: Mappable {
    
    var actors: [LNActorsModel]?
    var commentSpecial:String?
    var is3D:Bool = false
    var isDMAX:Bool = false
    var isEggHunt:Bool = false
    var isIMAX:Bool = false
    var isIMAX3D:Bool = false
    var movieId:Double = 0
    var overallRating:Double = 0
    var nameEn:String?
    var name:String?
    var mins:String?
    var releaseArea:String?
    var releaseDate:String?
    var story:String?
    var stageImg: LNStageModel?
    var video:LNVideoModel?
    var type:[String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        actors <- map["actors"]
        commentSpecial <- map["commentSpecial"]
        is3D <- map["is3D"]
        isDMAX <- map["isDMAX"]
        isEggHunt <- map["isEggHunt"]
        isIMAX <- map["isIMAX"]
        isIMAX3D <- map["isIMAX3D"]
        movieId <- map["movieId"]
        overallRating <- map["overallRating"]
        nameEn <- map["nameEn"]
        name <- map["name"]
        mins <- map["mins"]
        releaseArea <- map["releaseArea"]
        releaseDate <- map["releaseDate"]
        story <- map["story"]
        stageImg <- map["stageImg"]
        video <- map["video"]
        type <- map["type"]
    
    }
}

//演员列表

class LNActorsModel: Mappable {
    
    var actorId:Double = 0
    var img:String?
    var name:String?
    var nameEn:String?
    var roleName:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        actorId <- map["actorId"]
        img <- map["img"]
        name <- map["name"]
        nameEn <- map["nameEn"]
        roleName <- map["roleName"]
    }
}

//视频

class LNVideoModel :Mappable {
    
    var hightUrl:String?
    var img:String?
    var title:String?
    var url:String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        hightUrl <- map["hightUrl"]
        img <- map["img"]
        title <- map["title"]
        url <- map["url"]
    }
}
//影片精彩图片集合
class LNStageModel: Mappable {
    
    var list: [LNStageImgModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        list <- map["list"]
    }
}


class LNStageImgModel: Mappable {
    
    var imgId:Double = 0
    var imgUrl:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        imgId <- map["imgId"]
        imgUrl <- map["imgUrl"]
    }
}

//票房数据
class LNHomeBoxOfficeModel: Mappable {

    var movieId:Double = 0
    var ranking: Int = 0
    var todayBoxDes:String?
    var todayBoxDesUnit:String?
    var totalBoxDes:String?
    var totalBoxUnit:String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {

        movieId <- map["movieId"]
        ranking <- map["ranking"]
        todayBoxDes <- map["todayBoxDes"]
        todayBoxDesUnit <- map["todayBoxDesUnit"]
        totalBoxDes <- map["totalBoxDes"]
        totalBoxUnit <- map["totalBoxUnit"]

    }

}
