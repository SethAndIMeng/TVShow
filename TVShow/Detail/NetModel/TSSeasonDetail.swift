//
//  TSSeasonDetail.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSSeasonDetail: NSObject, Mappable {

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
    required public init?(map: Map){

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
}
