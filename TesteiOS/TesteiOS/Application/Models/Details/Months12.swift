//
//  Months12.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 06/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Months12: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let fund = "fund"
        static let cDI = "CDI"
    }
    
    // MARK: Properties
    public var fund: Double?
    public var cDI: Double?
    
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
        fund <- map[SerializationKeys.fund]
        cDI <- map[SerializationKeys.cDI]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = fund { dictionary[SerializationKeys.fund] = value }
        if let value = cDI { dictionary[SerializationKeys.cDI] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.fund = aDecoder.decodeObject(forKey: SerializationKeys.fund) as? Double
        self.cDI = aDecoder.decodeObject(forKey: SerializationKeys.cDI) as? Double
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(fund, forKey: SerializationKeys.fund)
        aCoder.encode(cDI, forKey: SerializationKeys.cDI)
    }
    
}


