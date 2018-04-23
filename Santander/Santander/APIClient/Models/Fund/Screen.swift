//
//  Screen.swift
//
//  Created by Gabriel Vieira on 4/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Screen: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let downInfo = "downInfo"
    static let definition = "definition"
    static let risk = "risk"
    static let fundName = "fundName"
    static let info = "info"
    static let infoTitle = "infoTitle"
    static let title = "title"
    static let riskTitle = "riskTitle"
    static let whatIs = "whatIs"
    static let moreInfo = "moreInfo"
  }

  // MARK: Properties
  public var downInfo: [DownInfo]?
  public var definition: String?
  public var risk: Int?
  public var fundName: String?
  public var info: [Info]?
  public var infoTitle: String?
  public var title: String?
  public var riskTitle: String?
  public var whatIs: String?
  public var moreInfo: MoreInfo?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public mutating func mapping(map: Map) {
    downInfo <- map[SerializationKeys.downInfo]
    definition <- map[SerializationKeys.definition]
    risk <- map[SerializationKeys.risk]
    fundName <- map[SerializationKeys.fundName]
    info <- map[SerializationKeys.info]
    infoTitle <- map[SerializationKeys.infoTitle]
    title <- map[SerializationKeys.title]
    riskTitle <- map[SerializationKeys.riskTitle]
    whatIs <- map[SerializationKeys.whatIs]
    moreInfo <- map[SerializationKeys.moreInfo]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = downInfo { dictionary[SerializationKeys.downInfo] = value.map { $0.dictionaryRepresentation() } }
    if let value = definition { dictionary[SerializationKeys.definition] = value }
    if let value = risk { dictionary[SerializationKeys.risk] = value }
    if let value = fundName { dictionary[SerializationKeys.fundName] = value }
    if let value = info { dictionary[SerializationKeys.info] = value.map { $0.dictionaryRepresentation() } }
    if let value = infoTitle { dictionary[SerializationKeys.infoTitle] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = riskTitle { dictionary[SerializationKeys.riskTitle] = value }
    if let value = whatIs { dictionary[SerializationKeys.whatIs] = value }
    if let value = moreInfo { dictionary[SerializationKeys.moreInfo] = value.dictionaryRepresentation() }
    return dictionary
  }

}
