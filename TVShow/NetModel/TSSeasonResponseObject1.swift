//
//  TSSeasonResponseObject1.swift
//
//  Created by imeng on 16/4/21
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSSeasonResponseObject1: Mappable, NSCoding, NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTSSeasonResponseObject1CurrentPageKey: String = "currentPage"
	internal let kTSSeasonResponseObject1ResultsKey: String = "results"
	internal let kTSSeasonResponseObject1TotalKey: String = "total"


    // MARK: Properties
	public var currentPage: Int?
	public var results: [TSResults]?
	public var total: Int?


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
		currentPage = json[kTSSeasonResponseObject1CurrentPageKey].int
		results = []
		if let items = json[kTSSeasonResponseObject1ResultsKey].array {
			for item in items {
				results?.append(TSResults(json: item))
			}
		} else {
			results = nil
		}
		total = json[kTSSeasonResponseObject1TotalKey].int

    }

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required init?(_ map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    func mapping(map: Map) {
		currentPage <- map[kTSSeasonResponseObject1CurrentPageKey]
		results <- map[kTSSeasonResponseObject1ResultsKey]
		total <- map[kTSSeasonResponseObject1TotalKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if currentPage != nil {
			dictionary.updateValue(currentPage!, forKey: kTSSeasonResponseObject1CurrentPageKey)
		}
		if results?.count > 0 {
			var temp: [AnyObject] = []
			for item in results! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kTSSeasonResponseObject1ResultsKey)
		}
		if total != nil {
			dictionary.updateValue(total!, forKey: kTSSeasonResponseObject1TotalKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.currentPage = aDecoder.decodeObjectForKey(kTSSeasonResponseObject1CurrentPageKey) as? Int
		self.results = aDecoder.decodeObjectForKey(kTSSeasonResponseObject1ResultsKey) as? [TSResults]
		self.total = aDecoder.decodeObjectForKey(kTSSeasonResponseObject1TotalKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(currentPage, forKey: kTSSeasonResponseObject1CurrentPageKey)
		aCoder.encodeObject(results, forKey: kTSSeasonResponseObject1ResultsKey)
		aCoder.encodeObject(total, forKey: kTSSeasonResponseObject1TotalKey)

    }

}
