//
//  Screen.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 06/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import ObjectMapper

public final class Screen: Mappable, NSCoding {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let title = "title"
        static let fundName = "fundName"
        static let whatIs = "whatIs"
        static let definition = "definition"
        static let riskTitle = "riskTitle"
        static let risk = "risk"
        static let infoTitle = "infoTitle"
        static let moreInfo = "moreInfo"
        static let info = "info"
        static let downInfo = "downInfo"
    }
    
    // MARK: Properties
    public var title: String?
    public var fundName: String?
    public var whatIs: String?
    public var definition: String?
    public var riskTitle: String?
    public var risk: Int?
    public var infoTitle: String?
    public var moreInfo: MoreInfo?
    public var info: [Info]?
    public var downInfo: [DownInfo]?
    
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
        title <- map[SerializationKeys.title]
        fundName <- map[SerializationKeys.fundName]
        whatIs <- map[SerializationKeys.whatIs]
        definition <- map[SerializationKeys.definition]
        riskTitle <- map[SerializationKeys.riskTitle]
        risk <- map[SerializationKeys.risk]
        infoTitle <- map[SerializationKeys.infoTitle]
        moreInfo <- map[SerializationKeys.moreInfo]
        info <- map[SerializationKeys.info]
        downInfo <- map[SerializationKeys.downInfo]
    }
    
    /// Generates description of the object in the form of a NSDictionary.
    ///
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = fundName { dictionary[SerializationKeys.fundName] = value }
        if let value = whatIs { dictionary[SerializationKeys.whatIs] = value }
        if let value = definition { dictionary[SerializationKeys.definition] = value }
        if let value = riskTitle { dictionary[SerializationKeys.riskTitle] = value }
        if let value = risk { dictionary[SerializationKeys.risk] = value }
        if let value = infoTitle { dictionary[SerializationKeys.infoTitle] = value }
        if let value = moreInfo { dictionary[SerializationKeys.moreInfo] = value }
        if let value = info { dictionary[SerializationKeys.info] = value.map({ $0.dictionaryRepresentation() }) }
        if let value = downInfo { dictionary[SerializationKeys.downInfo] = value.map({ $0.dictionaryRepresentation() }) }
        return dictionary
    }
    
    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
        self.fundName = aDecoder.decodeObject(forKey: SerializationKeys.fundName) as? String
        self.whatIs = aDecoder.decodeObject(forKey: SerializationKeys.whatIs) as? String
        self.definition = aDecoder.decodeObject(forKey: SerializationKeys.definition) as? String
        self.riskTitle = aDecoder.decodeObject(forKey: SerializationKeys.riskTitle) as? String
        self.risk = aDecoder.decodeObject(forKey: SerializationKeys.risk) as? Int
        self.infoTitle = aDecoder.decodeObject(forKey: SerializationKeys.infoTitle) as? String
        self.moreInfo = aDecoder.decodeObject(forKey: SerializationKeys.moreInfo) as? MoreInfo
        self.info = aDecoder.decodeObject(forKey: SerializationKeys.info) as? [Info]
        self.downInfo = aDecoder.decodeObject(forKey: SerializationKeys.downInfo) as? [DownInfo]
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: SerializationKeys.title)
        aCoder.encode(fundName, forKey: SerializationKeys.fundName)
        aCoder.encode(whatIs, forKey: SerializationKeys.whatIs)
        aCoder.encode(definition, forKey: SerializationKeys.definition)
        aCoder.encode(riskTitle, forKey: SerializationKeys.riskTitle)
        aCoder.encode(risk, forKey: SerializationKeys.risk)
        aCoder.encode(infoTitle, forKey: SerializationKeys.infoTitle)
        aCoder.encode(moreInfo, forKey: SerializationKeys.moreInfo)
        aCoder.encode(info, forKey: SerializationKeys.info)
        aCoder.encode(downInfo, forKey: SerializationKeys.downInfo)
    }
    
}


