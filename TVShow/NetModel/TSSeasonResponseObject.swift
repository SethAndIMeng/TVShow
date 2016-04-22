//
//  TSSeasonItem.swift
//  TVShow
//
//  Created by imeng on 16/4/6.
//  Copyright © 2016年 imeng. All rights reserved.
//
/*
{
    "code": "0000",
    "msg": "",
    "data": {
        "total": 5,
        "results": [{
        "sid": "509",
        "score": 7.9,
        "cat": "喜剧 / 动作 / 科幻",
        "title": "最后一个男人 第二季",
        "brief": "　FOX#续订#了季中新喜剧#最后一个男人#第二季。在未来的某一天，地球上除了Phil Miller，好像就没有别人了？！ 　　Phil到处搜寻其他幸存者却一无所获，但无论如何他都不会放弃，因为他坚信自己不是一个人。如果有一天他终于遇见了她，那就太妙了！",
        "upInfo": 13,
        "cover": "http://img.rrmj.tv/video/20151013/o_1444732802291.jpg",
        "enTitle": "The Last Man On Earth Season 2",
        "mark": "none",
        "seasonNo": 2,
        "id": 509
        }],
        "currentPage": 1
    }
}
*/

import Foundation
import SwiftyJSON
import ObjectMapper

class TSSeasonResponseObject: Mappable {
    var brief : String?
    var cat : String?
    var cover : String?
    var enTitle : String?
    var id : Int?
    var mark : String?
    var score : Float?
    var seasonNo : Int?
    var sid : String?
    var title : String?
    var upInfo : Int?
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        brief    <- map["brief"]
        cat    <- map["cat"]
        cover    <- map["cover"]
        enTitle    <- map["enTitle"]
        id    <- map["id"]
        mark    <- map["mark"]
        score    <- map["score"]
        seasonNo    <- map["seasonNo"]
        sid    <- map["sid"]
        title    <- map["title"]
        upInfo    <- map["upInfo"]
    }
}
