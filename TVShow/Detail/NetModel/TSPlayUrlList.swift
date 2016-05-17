//
//  TSPlayUrlList.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSPlayUrlList: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTSPlayUrlListSiteKey: String = "site"
	internal let kTSPlayUrlListPlayLinkKey: String = "playLink"
	internal let kTSPlayUrlListInternalIdentifierKey: String = "id"
	internal let kTSPlayUrlListEpisodeSidKey: String = "episodeSid"


    // MARK: Properties
	public var site: String?
	public var playLink: String?
	public var internalIdentifier: Int?
	public var episodeSid: String?


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
		site = json[kTSPlayUrlListSiteKey].string
		playLink = json[kTSPlayUrlListPlayLinkKey].string
		internalIdentifier = json[kTSPlayUrlListInternalIdentifierKey].int
		episodeSid = json[kTSPlayUrlListEpisodeSidKey].string

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
		site <- map[kTSPlayUrlListSiteKey]
		playLink <- map[kTSPlayUrlListPlayLinkKey]
		internalIdentifier <- map[kTSPlayUrlListInternalIdentifierKey]
		episodeSid <- map[kTSPlayUrlListEpisodeSidKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if site != nil {
			dictionary.updateValue(site!, forKey: kTSPlayUrlListSiteKey)
		}
		if playLink != nil {
			dictionary.updateValue(playLink!, forKey: kTSPlayUrlListPlayLinkKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kTSPlayUrlListInternalIdentifierKey)
		}
		if episodeSid != nil {
			dictionary.updateValue(episodeSid!, forKey: kTSPlayUrlListEpisodeSidKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.site = aDecoder.decodeObjectForKey(kTSPlayUrlListSiteKey) as? String
		self.playLink = aDecoder.decodeObjectForKey(kTSPlayUrlListPlayLinkKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kTSPlayUrlListInternalIdentifierKey) as? Int
		self.episodeSid = aDecoder.decodeObjectForKey(kTSPlayUrlListEpisodeSidKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(site, forKey: kTSPlayUrlListSiteKey)
		aCoder.encodeObject(playLink, forKey: kTSPlayUrlListPlayLinkKey)
		aCoder.encodeObject(internalIdentifier, forKey: kTSPlayUrlListInternalIdentifierKey)
		aCoder.encodeObject(episodeSid, forKey: kTSPlayUrlListEpisodeSidKey)

    }

}
