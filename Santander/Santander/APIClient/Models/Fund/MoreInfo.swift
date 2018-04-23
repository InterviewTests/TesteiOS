//
//  MoreInfo.swift
//
//  Created by Gabriel Vieira on 4/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct MoreInfo: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let year = "year"
    static let month = "month"
    static let twelveMonths = "12months"
  }

  // MARK: Properties
  public var year: Year?
  public var month: Month?
  public var twelveMonths: TwelveMonths?

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
    year <- map[SerializationKeys.year]
    month <- map[SerializationKeys.month]
    twelveMonths <- map[SerializationKeys.twelveMonths]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = year { dictionary[SerializationKeys.year] = value.dictionaryRepresentation() }
    if let value = month { dictionary[SerializationKeys.month] = value.dictionaryRepresentation() }
    if let value = twelveMonths { dictionary[SerializationKeys.twelveMonths] = value.dictionaryRepresentation() }
    return dictionary
  }

}
