//
//  LNHotCommentModel.swift
//  LoveNews
//
//  Created by yingz on 2018/5/4.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import ObjectMapper


class LNHotCommentModel: Mappable {
    
    var data :LNHotCommentDataModel?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        data <- map["data"]
        
    }
}


class LNHotCommentDataModel: Mappable {
    
    var cts: [LNCommentModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        cts <- map["cts"]
        
    }
}

class LNCommentModel: Mappable {
    
    var ca:String?
    var caimg:String?
    var cal:String?
    var cd:Double = 0
    var ce:String?
    var cr:Double = 0
    
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        ca <- map["ca"]
        caimg <- map["caimg"]
        cal <- map["cal"]
        cd <- map["cd"]
        ce <- map["ce"]
        cr <- map["cr"]
    }
}


