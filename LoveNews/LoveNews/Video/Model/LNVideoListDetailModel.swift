//
//  LNVideoListDetailModel.swift
//  LoveNews
//
//  Created by yingz on 2018/5/7.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import ObjectMapper


class LNVideoListDetailModel: Mappable {
    
    var data :LNLiveDataModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        data <- map["data"]
        
    }
}


class LNLiveDataModel: Mappable {
    
    var wonderVods: [LNItemModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        wonderVods <- map["wonderVods"]
        
    }
}

class LNItemModel: Mappable {
    
    var appointStatus:Double = 0
    var image:String?
    var liveId:Double = 0
    var liveStatus:Double = 0
    var preImage:String?
    var startTime:Double = 0
    var statistic:Double = 0
    var title:String?
    var videoId:Double = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        appointStatus <- map["appointStatus"]
        image <- map["image"]
        liveId <- map["liveId"]
        liveStatus <- map["liveStatus"]
        preImage <- map["preImage"]
        startTime <- map["startTime"]
        statistic <- map["statistic"]
        title <- map["title"]
        videoId <- map["videoId"]
    }
}
