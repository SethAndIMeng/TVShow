//
//  TSResponseObject.swift
//  TVShow
//
//  Created by imeng on 16/4/6.
//  Copyright © 2016年 imeng. All rights reserved.
//

//
//	TSResponseObject.swift
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON
import ObjectMapper

public class TSResponseObject: NSObject, Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kTSResponseObjectDataKey: String = "data"
    internal let kTSResponseObjectCodeKey: String = "code"
    internal let kTSResponseObjectMsgKey: String = "msg"
    
    
    // MARK: Properties
    public var data: Dictionary<String, AnyObject>?
    public var code: String?
    public var msg: String?
    
    
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
//        data = TSData(json: json[kTSResponseObjectDataKey])
        data = json[kTSResponseObjectDataKey].object as? Dictionary<String, AnyObject>
        code = json[kTSResponseObjectCodeKey].string
        msg = json[kTSResponseObjectMsgKey].string
        
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
        data <- map[kTSResponseObjectDataKey]
        code <- map[kTSResponseObjectCodeKey]
        msg <- map[kTSResponseObjectMsgKey]
        
    }
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if data != nil {
//            dictionary.updateValue(data!.dictionaryRepresentation(), forKey: kTSResponseObjectDataKey)
            dictionary.updateValue(data!, forKey: kTSResponseObjectDataKey)
        }
        if code != nil {
            dictionary.updateValue(code!, forKey: kTSResponseObjectCodeKey)
        }
        if msg != nil {
            dictionary.updateValue(msg!, forKey: kTSResponseObjectMsgKey)
        }
        
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.data = aDecoder.decodeObjectForKey(kTSResponseObjectDataKey) as? Dictionary
        self.code = aDecoder.decodeObjectForKey(kTSResponseObjectCodeKey) as? String
        self.msg = aDecoder.decodeObjectForKey(kTSResponseObjectMsgKey) as? String
        
    }
    
    public func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(data, forKey: kTSResponseObjectDataKey)
        aCoder.encodeObject(code, forKey: kTSResponseObjectCodeKey)
        aCoder.encodeObject(msg, forKey: kTSResponseObjectMsgKey)
        
    }
    
}