//
//  Fund.swift
//
//  Created by Gabriel Vieira on 4/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Fund: Mappable {

    public init() {}
  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let screen = "screen"
  }

  // MARK: Properties
  public var screen: Screen?

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
    screen <- map[SerializationKeys.screen]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = screen { dictionary[SerializationKeys.screen] = value.dictionaryRepresentation() }
    return dictionary
  }

}
