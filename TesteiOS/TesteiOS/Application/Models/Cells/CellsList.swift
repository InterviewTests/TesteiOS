//
//  CellsList.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 06/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import ObjectMapper

public final class CellList: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let id = "id"
        static let type = "type"
        static let message = "message"
        static let typefield = "typefield"
        static let hidden = "hidden"
        static let topSpacing = "topSpacing"
        static let show = "show"
        static let required = "required"
    }
    
    // MARK: Properties
    public var id:Int?
    public var type:Int?
    public var message:String?
    public var typefield:Int?
    public var hidden:Bool?
    public var topSpacing:Int?
    public var show:Int?
    public var required:Bool?
    
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
        id <- map[SerializationKeys.id]
        type <- map[SerializationKeys.type]
        message <- map[SerializationKeys.message]
        typefield <- map[SerializationKeys.typefield]
        hidden <- map[SerializationKeys.hidden]
        topSpacing <- map[SerializationKeys.topSpacing]
        show <- map[SerializationKeys.show]
        required <- map[SerializationKeys.required]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = type { dictionary[SerializationKeys.type] = value }
        if let value = message { dictionary[SerializationKeys.message] = value }
        if let value = typefield { dictionary[SerializationKeys.typefield] = value }
        if let value = hidden { dictionary[SerializationKeys.hidden] = value }
        if let value = topSpacing { dictionary[SerializationKeys.topSpacing] = value }
        if let value = show { dictionary[SerializationKeys.show] = value }
        if let value = required { dictionary[SerializationKeys.required] = value }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
        self.type = aDecoder.decodeObject(forKey: SerializationKeys.type) as? Int
        self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
        self.typefield = aDecoder.decodeObject(forKey: SerializationKeys.typefield) as? Int
        self.hidden = aDecoder.decodeObject(forKey: SerializationKeys.hidden) as? Bool
        self.topSpacing = aDecoder.decodeObject(forKey: SerializationKeys.topSpacing) as? Int
        self.show = aDecoder.decodeObject(forKey: SerializationKeys.show) as? Int
        self.required = aDecoder.decodeObject(forKey: SerializationKeys.required) as? Bool
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: SerializationKeys.id)
        aCoder.encode(type, forKey: SerializationKeys.type)
        aCoder.encode(message, forKey: SerializationKeys.message)
        aCoder.encode(typefield, forKey: SerializationKeys.typefield)
        aCoder.encode(hidden, forKey: SerializationKeys.hidden)
        aCoder.encode(topSpacing, forKey: SerializationKeys.topSpacing)
        aCoder.encode(show, forKey: SerializationKeys.show)
        aCoder.encode(required, forKey: SerializationKeys.required)
    }
    
}

