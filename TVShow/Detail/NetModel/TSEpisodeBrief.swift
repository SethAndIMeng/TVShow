//
//  TSEpisodeBrief.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSEpisodeBrief: NSObject, Mappable, NSCoding {

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
    required public init?(_ map: Map){

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

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if sid != nil {
			dictionary.updateValue(sid!, forKey: kTSEpisodeBriefSidKey)
		}
		if text != nil {
			dictionary.updateValue(text!, forKey: kTSEpisodeBriefTextKey)
		}
		if episode != nil {
			dictionary.updateValue(episode!, forKey: kTSEpisodeBriefEpisodeKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.sid = aDecoder.decodeObjectForKey(kTSEpisodeBriefSidKey) as? String
		self.text = aDecoder.decodeObjectForKey(kTSEpisodeBriefTextKey) as? String
		self.episode = aDecoder.decodeObjectForKey(kTSEpisodeBriefEpisodeKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(sid, forKey: kTSEpisodeBriefSidKey)
		aCoder.encodeObject(text, forKey: kTSEpisodeBriefTextKey)
		aCoder.encodeObject(episode, forKey: kTSEpisodeBriefEpisodeKey)

    }

}
