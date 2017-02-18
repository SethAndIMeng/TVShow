//
//  TSPlayUrlList.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSPlayUrlList: NSObject, Mappable {

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
    required public init?(map: Map){

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
}
