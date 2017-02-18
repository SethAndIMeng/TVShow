//
//  TSEpisodeBrief.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSEpisodeBrief: NSObject, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTSEpisodeBriefSidKey: String = "sid"
	internal let kTSEpisodeBriefTextKey: String = "text"
	internal let kTSEpisodeBriefEpisodeKey: String = "episode"


    // MARK: Properties
	public var sid: String?
	public var text: String?
	public var episode: String?


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
		sid = json[kTSEpisodeBriefSidKey].string
		text = json[kTSEpisodeBriefTextKey].string
		episode = json[kTSEpisodeBriefEpisodeKey].string

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
		sid <- map[kTSEpisodeBriefSidKey]
		text <- map[kTSEpisodeBriefTextKey]
		episode <- map[kTSEpisodeBriefEpisodeKey]

    }
}
