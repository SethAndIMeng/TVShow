//
//  TSRecommend.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSRecommend: NSObject, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTSRecommendTitleKey: String = "title"
	internal let kTSRecommendCatKey: String = "cat"
	internal let kTSRecommendInternalIdentifierKey: String = "id"
	internal let kTSRecommendSeasonNoKey: String = "seasonNo"
	internal let kTSRecommendFinishKey: String = "finish"
	internal let kTSRecommendScoreKey: String = "score"
	internal let kTSRecommendUpInfoKey: String = "upInfo"
	internal let kTSRecommendSidKey: String = "sid"
	internal let kTSRecommendCoverKey: String = "cover"
	internal let kTSRecommendEnTitleKey: String = "enTitle"


    // MARK: Properties
	public var title: String?
	public var cat: String?
	public var internalIdentifier: Int?
	public var seasonNo: Int?
	public var finish: Bool = false
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
		title = json[kTSRecommendTitleKey].string
		cat = json[kTSRecommendCatKey].string
		internalIdentifier = json[kTSRecommendInternalIdentifierKey].int
		seasonNo = json[kTSRecommendSeasonNoKey].int
		finish = json[kTSRecommendFinishKey].boolValue
		score = json[kTSRecommendScoreKey].float
		upInfo = json[kTSRecommendUpInfoKey].int
		sid = json[kTSRecommendSidKey].string
		cover = json[kTSRecommendCoverKey].string
		enTitle = json[kTSRecommendEnTitleKey].string

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
		title <- map[kTSRecommendTitleKey]
		cat <- map[kTSRecommendCatKey]
		internalIdentifier <- map[kTSRecommendInternalIdentifierKey]
		seasonNo <- map[kTSRecommendSeasonNoKey]
		finish <- map[kTSRecommendFinishKey]
		score <- map[kTSRecommendScoreKey]
		upInfo <- map[kTSRecommendUpInfoKey]
		sid <- map[kTSRecommendSidKey]
		cover <- map[kTSRecommendCoverKey]
		enTitle <- map[kTSRecommendEnTitleKey]

    }
}
