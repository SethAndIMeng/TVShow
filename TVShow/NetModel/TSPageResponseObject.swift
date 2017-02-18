//
//  TSPageResponseObject.swift
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
        "total": 84,
        "results": [{
        "sid": "1332",
        "score": 8.9,
        "cat": "原创",
        "title": "黑暗料理",
        "brief": "看我融化一切，燃烧万物！看融铜如何与世间种种擦出火花，全程疯狂暴力，在偶尔的爆炸和意外中孕育黑暗料理~爽爆你的大脑！第五集：融铜VS爆炸的冰；第六集：融铜VS椰子；第七集：融盐VS铅珠",
        "upInfo": 7,
        "cover": "http://img.rrmj.tv/video/20160317/o_1458211122153.jpg",
        "enTitle": "",
        "mark": "update",
        "seasonNo": 1,
        "id": 1332
        }, ],
        "currentPage": 1
    }
}
*/


import Foundation
import SwiftyJSON
import ObjectMapper

class TSPageResponseObject: NSObject, Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kTSDataCurrentPageKey: String = "currentPage"
    internal let kTSDataResultsKey: String = "results"
    internal let kTSDataTotalKey: String = "total"
    
    
    // MARK: Properties
    internal var currentPage: Int?
    internal var results: [Dictionary<String, AnyObject>]?
    internal var total: Int?
    
    
    // MARK: SwiftyJSON Initalizers
    /**
     Initates the class based on the object
     - parameter object: The object of either Dictionary or Array kind that was passed.
     - returns: An initalized instance of the class.
     */
    convenience internal init(object: AnyObject) {
        self.init(json: JSON(object))
    }
    
    /**
     Initates the class based on the JSON that was passed.
     - parameter json: JSON object from SwiftyJSON.
     - returns: An initalized instance of the class.
     */
    internal init(json: JSON) {
        currentPage = json[kTSDataCurrentPageKey].int
        results = []
//        if let items = json[kTSDataResultsKey].array {
//            for item in items {
//                results?.append(TSResults(json: item))
//            }
//        } else {
//            results = nil
//        }
        total = json[kTSDataTotalKey].int
        
    }
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required init?(map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    func mapping(map: Map) {
        currentPage <- map[kTSDataCurrentPageKey]
        results <- map[kTSDataResultsKey]
        total <- map[kTSDataTotalKey]
        
    }
}
