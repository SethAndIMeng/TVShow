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

public class TSSeasonResponseObject: NSObject, Mappable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kTSResultsTitleKey: String = "title"
    internal let kTSResultsBriefKey: String = "brief"
    internal let kTSResultsCatKey: String = "cat"
    internal let kTSResultsInternalIdentifierKey: String = "id"
    internal let kTSResultsSeasonNoKey: String = "seasonNo"
    internal let kTSResultsMarkKey: String = "mark"
    internal let kTSResultsScoreKey: String = "rating.value"
    internal let kTSResultsUpInfoKey: String = "upInfo"
    internal let kTSResultsSidKey: String = "id"
    internal let kTSResultsCoverKey: String = "images"
    internal let kTSResultsEnTitleKey: String = "enTitle"
    
    
    // MARK: Properties
    public var title: String?
    public var brief: String?
    public var cat: String?
    public var internalIdentifier: Int?
    public var seasonNo: Int?
    public var mark: String?
    public var score: Float?
    public var upInfo: Int?
    public var sid: String?
    public var cover: String?
    public var enTitle: String?
    
    
    // MARK: SwiftyJSON Initalizers
    /**
     Initates the class based on the object
     - parameter object: The object of either Dictionary or Array kind that was passed.
     - returns: An initalized instance of the class.
     */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }
    
    /**
     Initates the class based on the JSON that was passed.
     - parameter json: JSON object from SwiftyJSON.
     - returns: An initalized instance of the class.
     */
    public init(json: JSON) {
        title = json[kTSResultsTitleKey].string
        brief = json[kTSResultsBriefKey].string
        cat = json[kTSResultsCatKey].string
        internalIdentifier = json[kTSResultsInternalIdentifierKey].int
        seasonNo = json[kTSResultsSeasonNoKey].int
        mark = json[kTSResultsMarkKey].string
        score = json[kTSResultsScoreKey].float
        upInfo = json[kTSResultsUpInfoKey].int
        sid = json[kTSResultsSidKey].string
        cover = json[kTSResultsCoverKey]["large"].string
        enTitle = json[kTSResultsEnTitleKey].string
        
    }
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required public init?(map: Map){
        
    }
    
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    public func mapping(map: Map) {
        title <- map[kTSResultsTitleKey]
        brief <- map[kTSResultsBriefKey]
        cat <- map[kTSResultsCatKey]
        internalIdentifier <- map[kTSResultsInternalIdentifierKey]
        seasonNo <- map[kTSResultsSeasonNoKey]
        mark <- map[kTSResultsMarkKey]
        score <- map[kTSResultsScoreKey]
        upInfo <- map[kTSResultsUpInfoKey]
        sid <- map[kTSResultsSidKey]
        cover <- map[kTSResultsCoverKey]
        enTitle <- map[kTSResultsEnTitleKey]
        
    }    
}
