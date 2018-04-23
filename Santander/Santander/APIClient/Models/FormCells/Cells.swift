//
//  Cells.swift
//
//  Created by Gabriel Vieira on 4/22/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Cells: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let hidden = "hidden"
    static let id = "id"
    static let topSpacing = "topSpacing"
    static let typefield = "typefield"
    static let required = "required"
    static let message = "message"
    static let type = "type"
    static let show = "show"
  }

  // MARK: Properties
  public var hidden: Bool? = false
  public var id: Int?
  public var topSpacing: Int?
  public var typefield: Int?
  public var required: Bool? = false
  public var message: String?
  public var type: Int?
  public var show: Int?

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
    hidden <- map[SerializationKeys.hidden]
    id <- map[SerializationKeys.id]
    topSpacing <- map[SerializationKeys.topSpacing]
    typefield <- map[SerializationKeys.typefield]
    required <- map[SerializationKeys.required]
    message <- map[SerializationKeys.message]
    type <- map[SerializationKeys.type]
    show <- map[SerializationKeys.show]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.hidden] = hidden
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = topSpacing { dictionary[SerializationKeys.topSpacing] = value }
    if let value = typefield { dictionary[SerializationKeys.typefield] = value }
    dictionary[SerializationKeys.required] = required
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = show { dictionary[SerializationKeys.show] = value }
    return dictionary
  }

}
