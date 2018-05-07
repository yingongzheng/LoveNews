//
//  LNVideoCommentModel.swift
//  LoveNews
//
//  Created by yingz on 2018/5/7.
//  Copyright © 2018年 ygz. All rights reserved.
//

import UIKit
import ObjectMapper


class LNVideoCommentDetailModel: Mappable {
    
    var data :LNVideoCommentDataModel?
    var pager:LNVideoCommentPager?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        data <- map["data"]
        pager <- map["pager"]
        
    }
}

class LNVideoCommentDataModel: Mappable {
    
    var list: [LNVideoCommentModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        list <- map["list"]
        
    }
}

class LNVideoCommentPager: Mappable {
    
    var currentPage:Double = 0
    var hasMore:Bool = false
    var pageSize:Double = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        currentPage <- map["currentPage"]
        hasMore <- map["hasMore"]
        pageSize <- map["pageSize"]
    }
}



class LNVideoCommentModel: Mappable {
    
    var replyCount:Double = 0
    var createTime:String?
    var showTime:String?
    var nickname:String?
    var avator:String?
    var id:Double = 0
    var userId:Double = 0
    var content:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        replyCount <- map["replyCount"]
        createTime <- map["createTime"]
        showTime <- map["showTime"]
        nickname <- map["nickname"]
        avator <- map["avator"]
        id <- map["id"]
        userId <- map["userId"]
        content <- map["content"]
    }
}
