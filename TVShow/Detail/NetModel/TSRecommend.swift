//
//  TSRecommend.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSRecommend: NSObject, Mappable, NSCoding {

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
    required public init?(_ map: Map){

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

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title!, forKey: kTSRecommendTitleKey)
		}
		if cat != nil {
			dictionary.updateValue(cat!, forKey: kTSRecommendCatKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kTSRecommendInternalIdentifierKey)
		}
		if seasonNo != nil {
			dictionary.updateValue(seasonNo!, forKey: kTSRecommendSeasonNoKey)
		}
		dictionary.updateValue(finish, forKey: kTSRecommendFinishKey)
		if score != nil {
			dictionary.updateValue(score!, forKey: kTSRecommendScoreKey)
		}
		if upInfo != nil {
			dictionary.updateValue(upInfo!, forKey: kTSRecommendUpInfoKey)
		}
		if sid != nil {
			dictionary.updateValue(sid!, forKey: kTSRecommendSidKey)
		}
		if cover != nil {
			dictionary.updateValue(cover!, forKey: kTSRecommendCoverKey)
		}
		if enTitle != nil {
			dictionary.updateValue(enTitle!, forKey: kTSRecommendEnTitleKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObjectForKey(kTSRecommendTitleKey) as? String
		self.cat = aDecoder.decodeObjectForKey(kTSRecommendCatKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kTSRecommendInternalIdentifierKey) as? Int
		self.seasonNo = aDecoder.decodeObjectForKey(kTSRecommendSeasonNoKey) as? Int
		self.finish = aDecoder.decodeBoolForKey(kTSRecommendFinishKey)
		self.score = aDecoder.decodeObjectForKey(kTSRecommendScoreKey) as? Float
		self.upInfo = aDecoder.decodeObjectForKey(kTSRecommendUpInfoKey) as? Int
		self.sid = aDecoder.decodeObjectForKey(kTSRecommendSidKey) as? String
		self.cover = aDecoder.decodeObjectForKey(kTSRecommendCoverKey) as? String
		self.enTitle = aDecoder.decodeObjectForKey(kTSRecommendEnTitleKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(title, forKey: kTSRecommendTitleKey)
		aCoder.encodeObject(cat, forKey: kTSRecommendCatKey)
		aCoder.encodeObject(internalIdentifier, forKey: kTSRecommendInternalIdentifierKey)
		aCoder.encodeObject(seasonNo, forKey: kTSRecommendSeasonNoKey)
		aCoder.encodeBool(finish, forKey: kTSRecommendFinishKey)
		aCoder.encodeObject(score, forKey: kTSRecommendScoreKey)
		aCoder.encodeObject(upInfo, forKey: kTSRecommendUpInfoKey)
		aCoder.encodeObject(sid, forKey: kTSRecommendSidKey)
		aCoder.encodeObject(cover, forKey: kTSRecommendCoverKey)
		aCoder.encodeObject(enTitle, forKey: kTSRecommendEnTitleKey)

    }

}
