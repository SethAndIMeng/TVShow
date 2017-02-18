//
//  TSSiteList.swift
//
//  Created by imeng on 16/5/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSSiteList: NSObject, Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTSSiteListEnSiteKey: String = "enSite"
	internal let kTSSiteListCnSiteKey: String = "cnSite"


    // MARK: Properties
	public var enSite: String?
	public var cnSite: String?


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
		enSite = json[kTSSiteListEnSiteKey].string
		cnSite = json[kTSSiteListCnSiteKey].string

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
		enSite <- map[kTSSiteListEnSiteKey]
		cnSite <- map[kTSSiteListCnSiteKey]

    }
}
