//
//  Months12.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 06/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import ObjectMapper

public final class MoreInfo: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let month = "month"
        static let year = "year"
        static let months12 = "12months"
    }
    
    // MARK: Properties
    public var month: Month?
    public var year: Year?
    public var months12: Months12?
    
    // MARK: ObjectMapper Initializers
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public required init?(map: Map){
        
    }
    
    /// Map a JSON object to this class using ObjectMapper.
    ///
    /// - parameter map: A mapping from ObjectMapper.
    public func mapping(map: Map) {
        month <- map[SerializationKeys.month]
        year <- map[SerializationKeys.year]
        months12 <- map[SerializationKeys.months12]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = month { dictionary[SerializationKeys.month] = value }
        if let value = year { dictionary[SerializationKeys.year] = value }
        if let value = months12 { dictionary[SerializationKeys.months12] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.month = aDecoder.decodeObject(forKey: SerializationKeys.month) as? Month
        self.year = aDecoder.decodeObject(forKey: SerializationKeys.year) as? Year
        self.months12 = aDecoder.decodeObject(forKey: SerializationKeys.months12) as? Months12
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(month, forKey: SerializationKeys.month)
        aCoder.encode(year, forKey: SerializationKeys.year)
        aCoder.encode(months12, forKey: SerializationKeys.months12)
    }
    
}


