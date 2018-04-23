//
//  12months.swift
//
//  Created by Gabriel Vieira on 4/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct TwelveMonths: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cDI = "CDI"
    static let fund = "fund"
  }

  // MARK: Properties
  public var cDI: Double?
  public var fund: Double?

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
    cDI <- map[SerializationKeys.cDI]
    fund <- map[SerializationKeys.fund]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = cDI { dictionary[SerializationKeys.cDI] = value }
    if let value = fund { dictionary[SerializationKeys.fund] = value }
    return dictionary
  }

}
