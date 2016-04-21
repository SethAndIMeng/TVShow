//
//  TSBaseClass.swift
//
//  Created by lkx on 16/4/21
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSBaseClass: Mappable, NSCoding, NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTSBaseClassCurrentPageKey: String = "currentPage"
	internal let kTSBaseClassResultsKey: String = "results"
	internal let kTSBaseClassTotalKey: String = "total"


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
		currentPage = json[kTSBaseClassCurrentPageKey].int
		results = []
		if let items = json[kTSBaseClassResultsKey].array {
			for item in items {
				results?.append(TSResults(json: item))
			}
		} else {
			results = nil
		}
		total = json[kTSBaseClassTotalKey].int

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
		currentPage <- map[kTSBaseClassCurrentPageKey]
		results <- map[kTSBaseClassResultsKey]
		total <- map[kTSBaseClassTotalKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if currentPage != nil {
			dictionary.updateValue(currentPage!, forKey: kTSBaseClassCurrentPageKey)
		}
		if results?.count > 0 {
			var temp: [AnyObject] = []
			for item in results! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kTSBaseClassResultsKey)
		}
		if total != nil {
			dictionary.updateValue(total!, forKey: kTSBaseClassTotalKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.currentPage = aDecoder.decodeObjectForKey(kTSBaseClassCurrentPageKey) as? Int
		self.results = aDecoder.decodeObjectForKey(kTSBaseClassResultsKey) as? [TSResults]
		self.total = aDecoder.decodeObjectForKey(kTSBaseClassTotalKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(currentPage, forKey: kTSBaseClassCurrentPageKey)
		aCoder.encodeObject(results, forKey: kTSBaseClassResultsKey)
		aCoder.encodeObject(total, forKey: kTSBaseClassTotalKey)

    }

}
