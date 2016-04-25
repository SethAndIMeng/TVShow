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

public class TSSeasonResponseObject: NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kTSResultsTitleKey: String = "title"
    internal let kTSResultsBriefKey: String = "brief"
    internal let kTSResultsCatKey: String = "cat"
    internal let kTSResultsInternalIdentifierKey: String = "id"
    internal let kTSResultsSeasonNoKey: String = "seasonNo"
    internal let kTSResultsMarkKey: String = "mark"
    internal let kTSResultsScoreKey: String = "score"
    internal let kTSResultsUpInfoKey: String = "upInfo"
    internal let kTSResultsSidKey: String = "sid"
    internal let kTSResultsCoverKey: String = "cover"
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
        cover = json[kTSResultsCoverKey].string
        enTitle = json[kTSResultsEnTitleKey].string
        
    }
    
    // MARK: ObjectMapper Initalizers
    /**
     Map a JSON object to this class using ObjectMapper
     - parameter map: A mapping from ObjectMapper
     */
    required public init?(_ map: Map){
        
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
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if title != nil {
            dictionary.updateValue(title!, forKey: kTSResultsTitleKey)
        }
        if brief != nil {
            dictionary.updateValue(brief!, forKey: kTSResultsBriefKey)
        }
        if cat != nil {
            dictionary.updateValue(cat!, forKey: kTSResultsCatKey)
        }
        if internalIdentifier != nil {
            dictionary.updateValue(internalIdentifier!, forKey: kTSResultsInternalIdentifierKey)
        }
        if seasonNo != nil {
            dictionary.updateValue(seasonNo!, forKey: kTSResultsSeasonNoKey)
        }
        if mark != nil {
            dictionary.updateValue(mark!, forKey: kTSResultsMarkKey)
        }
        if score != nil {
            dictionary.updateValue(score!, forKey: kTSResultsScoreKey)
        }
        if upInfo != nil {
            dictionary.updateValue(upInfo!, forKey: kTSResultsUpInfoKey)
        }
        if sid != nil {
            dictionary.updateValue(sid!, forKey: kTSResultsSidKey)
        }
        if cover != nil {
            dictionary.updateValue(cover!, forKey: kTSResultsCoverKey)
        }
        if enTitle != nil {
            dictionary.updateValue(enTitle!, forKey: kTSResultsEnTitleKey)
        }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey(kTSResultsTitleKey) as? String
        self.brief = aDecoder.decodeObjectForKey(kTSResultsBriefKey) as? String
        self.cat = aDecoder.decodeObjectForKey(kTSResultsCatKey) as? String
        self.internalIdentifier = aDecoder.decodeObjectForKey(kTSResultsInternalIdentifierKey) as? Int
        self.seasonNo = aDecoder.decodeObjectForKey(kTSResultsSeasonNoKey) as? Int
        self.mark = aDecoder.decodeObjectForKey(kTSResultsMarkKey) as? String
        self.score = aDecoder.decodeObjectForKey(kTSResultsScoreKey) as? Float
        self.upInfo = aDecoder.decodeObjectForKey(kTSResultsUpInfoKey) as? Int
        self.sid = aDecoder.decodeObjectForKey(kTSResultsSidKey) as? String
        self.cover = aDecoder.decodeObjectForKey(kTSResultsCoverKey) as? String
        self.enTitle = aDecoder.decodeObjectForKey(kTSResultsEnTitleKey) as? String
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: kTSResultsTitleKey)
        aCoder.encodeObject(brief, forKey: kTSResultsBriefKey)
        aCoder.encodeObject(cat, forKey: kTSResultsCatKey)
        aCoder.encodeObject(internalIdentifier, forKey: kTSResultsInternalIdentifierKey)
        aCoder.encodeObject(seasonNo, forKey: kTSResultsSeasonNoKey)
        aCoder.encodeObject(mark, forKey: kTSResultsMarkKey)
        aCoder.encodeObject(score, forKey: kTSResultsScoreKey)
        aCoder.encodeObject(upInfo, forKey: kTSResultsUpInfoKey)
        aCoder.encodeObject(sid, forKey: kTSResultsSidKey)
        aCoder.encodeObject(cover, forKey: kTSResultsCoverKey)
        aCoder.encodeObject(enTitle, forKey: kTSResultsEnTitleKey)
        
    }
    
}
