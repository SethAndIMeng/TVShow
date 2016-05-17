//
//  TSSeasonDetail.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSSeasonDetail: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTSSeasonDetailTitleKey: String = "title"
	internal let kTSSeasonDetailEpisodeBriefKey: String = "episode_brief"
	internal let kTSSeasonDetailBriefKey: String = "brief"
	internal let kTSSeasonDetailCreateTimeStrKey: String = "createTimeStr"
	internal let kTSSeasonDetailPlayStatusKey: String = "playStatus"
	internal let kTSSeasonDetailTotalKey: String = "total"
	internal let kTSSeasonDetailUpdateinfoKey: String = "updateinfo"
	internal let kTSSeasonDetailUpdateTimeKey: String = "updateTime"
	internal let kTSSeasonDetailCoverKey: String = "cover"
	internal let kTSSeasonDetailCreateTimeKey: String = "createTime"
	internal let kTSSeasonDetailViewCountKey: String = "viewCount"
	internal let kTSSeasonDetailCatKey: String = "cat"
	internal let kTSSeasonDetailActorListKey: String = "actorList"
	internal let kTSSeasonDetailInternalIdentifierKey: String = "id"
	internal let kTSSeasonDetailSeriesIdKey: String = "seriesId"
	internal let kTSSeasonDetailIsFocusKey: String = "isFocus"
	internal let kTSSeasonDetailScoreKey: String = "score"
	internal let kTSSeasonDetailRecommendKey: String = "recommend"
	internal let kTSSeasonDetailPlayUrlListKey: String = "playUrlList"
	internal let kTSSeasonDetailSidKey: String = "sid"
	internal let kTSSeasonDetailEnTitleKey: String = "enTitle"
	internal let kTSSeasonDetailSiteListKey: String = "siteList"


    // MARK: Properties
	public var title: String?
	public var episodeBrief: [TSEpisodeBrief]?
	public var brief: String?
	public var createTimeStr: String?
	public var playStatus: String?
	public var total: Int?
	public var updateinfo: Int?
	public var updateTime: Int?
	public var cover: String?
	public var createTime: Int?
	public var viewCount: Int?
	public var cat: String?
	public var actorList: [String]?
	public var internalIdentifier: Int?
	public var seriesId: Int?
	public var isFocus: Bool = false
	public var score: Float?
	public var recommend: [TSRecommend]?
	public var playUrlList: [TSPlayUrlList]?
	public var sid: String?
	public var enTitle: String?
	public var siteList: [TSSiteList]?


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
		title = json[kTSSeasonDetailTitleKey].string
		episodeBrief = []
		if let items = json[kTSSeasonDetailEpisodeBriefKey].array {
			for item in items {
				episodeBrief?.append(TSEpisodeBrief(json: item))
			}
		} else {
			episodeBrief = nil
		}
		brief = json[kTSSeasonDetailBriefKey].string
		createTimeStr = json[kTSSeasonDetailCreateTimeStrKey].string
		playStatus = json[kTSSeasonDetailPlayStatusKey].string
		total = json[kTSSeasonDetailTotalKey].int
		updateinfo = json[kTSSeasonDetailUpdateinfoKey].int
		updateTime = json[kTSSeasonDetailUpdateTimeKey].int
		cover = json[kTSSeasonDetailCoverKey].string
		createTime = json[kTSSeasonDetailCreateTimeKey].int
		viewCount = json[kTSSeasonDetailViewCountKey].int
		cat = json[kTSSeasonDetailCatKey].string
		if let tempValue = json[kTSSeasonDetailActorListKey].array {
        actorList = tempValue.map({ (item:JSON) -> String in
            return item.string!
      })
		} else {
			actorList = nil
		}
		internalIdentifier = json[kTSSeasonDetailInternalIdentifierKey].int
		seriesId = json[kTSSeasonDetailSeriesIdKey].int
		isFocus = json[kTSSeasonDetailIsFocusKey].boolValue
		score = json[kTSSeasonDetailScoreKey].float
		recommend = []
		if let items = json[kTSSeasonDetailRecommendKey].array {
			for item in items {
				recommend?.append(TSRecommend(json: item))
			}
		} else {
			recommend = nil
		}
		playUrlList = []
		if let items = json[kTSSeasonDetailPlayUrlListKey].array {
			for item in items {
				playUrlList?.append(TSPlayUrlList(json: item))
			}
		} else {
			playUrlList = nil
		}
		sid = json[kTSSeasonDetailSidKey].string
		enTitle = json[kTSSeasonDetailEnTitleKey].string
		siteList = []
		if let items = json[kTSSeasonDetailSiteListKey].array {
			for item in items {
				siteList?.append(TSSiteList(json: item))
			}
		} else {
			siteList = nil
		}

    }

    public init(seasonObject:TSSeasonResponseObject) {
        title = seasonObject.title
        brief = seasonObject.brief
        cat = seasonObject.cat
        internalIdentifier = seasonObject.internalIdentifier
        score = seasonObject.score
        updateinfo = seasonObject.upInfo
        sid = seasonObject.sid
        cover = seasonObject.cover
        enTitle = seasonObject.enTitle
//        public var title: String?
//        public var brief: String?
//        public var cat: String?
//        public var internalIdentifier: Int?
//        public var seasonNo: Int?
//        public var mark: String?
//        public var score: Float?
//        public var upInfo: Int?
//        public var sid: String?
//        public var cover: String?
//        public var enTitle: String?
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
		title <- map[kTSSeasonDetailTitleKey]
		episodeBrief <- map[kTSSeasonDetailEpisodeBriefKey]
		brief <- map[kTSSeasonDetailBriefKey]
		createTimeStr <- map[kTSSeasonDetailCreateTimeStrKey]
		playStatus <- map[kTSSeasonDetailPlayStatusKey]
		total <- map[kTSSeasonDetailTotalKey]
		updateinfo <- map[kTSSeasonDetailUpdateinfoKey]
		updateTime <- map[kTSSeasonDetailUpdateTimeKey]
		cover <- map[kTSSeasonDetailCoverKey]
		createTime <- map[kTSSeasonDetailCreateTimeKey]
		viewCount <- map[kTSSeasonDetailViewCountKey]
		cat <- map[kTSSeasonDetailCatKey]
		actorList <- map[kTSSeasonDetailActorListKey]
		internalIdentifier <- map[kTSSeasonDetailInternalIdentifierKey]
		seriesId <- map[kTSSeasonDetailSeriesIdKey]
		isFocus <- map[kTSSeasonDetailIsFocusKey]
		score <- map[kTSSeasonDetailScoreKey]
		recommend <- map[kTSSeasonDetailRecommendKey]
		playUrlList <- map[kTSSeasonDetailPlayUrlListKey]
		sid <- map[kTSSeasonDetailSidKey]
		enTitle <- map[kTSSeasonDetailEnTitleKey]
		siteList <- map[kTSSeasonDetailSiteListKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title!, forKey: kTSSeasonDetailTitleKey)
		}
		if episodeBrief?.count > 0 {
			var temp: [AnyObject] = []
			for item in episodeBrief! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kTSSeasonDetailEpisodeBriefKey)
		}
		if brief != nil {
			dictionary.updateValue(brief!, forKey: kTSSeasonDetailBriefKey)
		}
		if createTimeStr != nil {
			dictionary.updateValue(createTimeStr!, forKey: kTSSeasonDetailCreateTimeStrKey)
		}
		if playStatus != nil {
			dictionary.updateValue(playStatus!, forKey: kTSSeasonDetailPlayStatusKey)
		}
		if total != nil {
			dictionary.updateValue(total!, forKey: kTSSeasonDetailTotalKey)
		}
		if updateinfo != nil {
			dictionary.updateValue(updateinfo!, forKey: kTSSeasonDetailUpdateinfoKey)
		}
		if updateTime != nil {
			dictionary.updateValue(updateTime!, forKey: kTSSeasonDetailUpdateTimeKey)
		}
		if cover != nil {
			dictionary.updateValue(cover!, forKey: kTSSeasonDetailCoverKey)
		}
		if createTime != nil {
			dictionary.updateValue(createTime!, forKey: kTSSeasonDetailCreateTimeKey)
		}
		if viewCount != nil {
			dictionary.updateValue(viewCount!, forKey: kTSSeasonDetailViewCountKey)
		}
		if cat != nil {
			dictionary.updateValue(cat!, forKey: kTSSeasonDetailCatKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kTSSeasonDetailInternalIdentifierKey)
		}
		if seriesId != nil {
			dictionary.updateValue(seriesId!, forKey: kTSSeasonDetailSeriesIdKey)
		}
		dictionary.updateValue(isFocus, forKey: kTSSeasonDetailIsFocusKey)
		if score != nil {
			dictionary.updateValue(score!, forKey: kTSSeasonDetailScoreKey)
		}
		if recommend?.count > 0 {
			var temp: [AnyObject] = []
			for item in recommend! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kTSSeasonDetailRecommendKey)
		}
		if playUrlList?.count > 0 {
			var temp: [AnyObject] = []
			for item in playUrlList! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kTSSeasonDetailPlayUrlListKey)
		}
		if sid != nil {
			dictionary.updateValue(sid!, forKey: kTSSeasonDetailSidKey)
		}
		if enTitle != nil {
			dictionary.updateValue(enTitle!, forKey: kTSSeasonDetailEnTitleKey)
		}
		if siteList?.count > 0 {
			var temp: [AnyObject] = []
			for item in siteList! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kTSSeasonDetailSiteListKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObjectForKey(kTSSeasonDetailTitleKey) as? String
		self.episodeBrief = aDecoder.decodeObjectForKey(kTSSeasonDetailEpisodeBriefKey) as? [TSEpisodeBrief]
		self.brief = aDecoder.decodeObjectForKey(kTSSeasonDetailBriefKey) as? String
		self.createTimeStr = aDecoder.decodeObjectForKey(kTSSeasonDetailCreateTimeStrKey) as? String
		self.playStatus = aDecoder.decodeObjectForKey(kTSSeasonDetailPlayStatusKey) as? String
		self.total = aDecoder.decodeObjectForKey(kTSSeasonDetailTotalKey) as? Int
		self.updateinfo = aDecoder.decodeObjectForKey(kTSSeasonDetailUpdateinfoKey) as? Int
		self.updateTime = aDecoder.decodeObjectForKey(kTSSeasonDetailUpdateTimeKey) as? Int
		self.cover = aDecoder.decodeObjectForKey(kTSSeasonDetailCoverKey) as? String
		self.createTime = aDecoder.decodeObjectForKey(kTSSeasonDetailCreateTimeKey) as? Int
		self.viewCount = aDecoder.decodeObjectForKey(kTSSeasonDetailViewCountKey) as? Int
		self.cat = aDecoder.decodeObjectForKey(kTSSeasonDetailCatKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kTSSeasonDetailInternalIdentifierKey) as? Int
		self.seriesId = aDecoder.decodeObjectForKey(kTSSeasonDetailSeriesIdKey) as? Int
		self.isFocus = aDecoder.decodeBoolForKey(kTSSeasonDetailIsFocusKey)
		self.score = aDecoder.decodeObjectForKey(kTSSeasonDetailScoreKey) as? Float
		self.recommend = aDecoder.decodeObjectForKey(kTSSeasonDetailRecommendKey) as? [TSRecommend]
		self.playUrlList = aDecoder.decodeObjectForKey(kTSSeasonDetailPlayUrlListKey) as? [TSPlayUrlList]
		self.sid = aDecoder.decodeObjectForKey(kTSSeasonDetailSidKey) as? String
		self.enTitle = aDecoder.decodeObjectForKey(kTSSeasonDetailEnTitleKey) as? String
		self.siteList = aDecoder.decodeObjectForKey(kTSSeasonDetailSiteListKey) as? [TSSiteList]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(title, forKey: kTSSeasonDetailTitleKey)
		aCoder.encodeObject(episodeBrief, forKey: kTSSeasonDetailEpisodeBriefKey)
		aCoder.encodeObject(brief, forKey: kTSSeasonDetailBriefKey)
		aCoder.encodeObject(createTimeStr, forKey: kTSSeasonDetailCreateTimeStrKey)
		aCoder.encodeObject(playStatus, forKey: kTSSeasonDetailPlayStatusKey)
		aCoder.encodeObject(total, forKey: kTSSeasonDetailTotalKey)
		aCoder.encodeObject(updateinfo, forKey: kTSSeasonDetailUpdateinfoKey)
		aCoder.encodeObject(updateTime, forKey: kTSSeasonDetailUpdateTimeKey)
		aCoder.encodeObject(cover, forKey: kTSSeasonDetailCoverKey)
		aCoder.encodeObject(createTime, forKey: kTSSeasonDetailCreateTimeKey)
		aCoder.encodeObject(viewCount, forKey: kTSSeasonDetailViewCountKey)
		aCoder.encodeObject(cat, forKey: kTSSeasonDetailCatKey)
		aCoder.encodeObject(actorList, forKey: kTSSeasonDetailActorListKey)
		aCoder.encodeObject(internalIdentifier, forKey: kTSSeasonDetailInternalIdentifierKey)
		aCoder.encodeObject(seriesId, forKey: kTSSeasonDetailSeriesIdKey)
		aCoder.encodeBool(isFocus, forKey: kTSSeasonDetailIsFocusKey)
		aCoder.encodeObject(score, forKey: kTSSeasonDetailScoreKey)
		aCoder.encodeObject(recommend, forKey: kTSSeasonDetailRecommendKey)
		aCoder.encodeObject(playUrlList, forKey: kTSSeasonDetailPlayUrlListKey)
		aCoder.encodeObject(sid, forKey: kTSSeasonDetailSidKey)
		aCoder.encodeObject(enTitle, forKey: kTSSeasonDetailEnTitleKey)
		aCoder.encodeObject(siteList, forKey: kTSSeasonDetailSiteListKey)

    }

}
