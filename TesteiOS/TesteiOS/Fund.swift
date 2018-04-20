import Foundation

public struct Fund: Codable {
  
  public let screen: Screen
  
  enum CodingKeys: String, CodingKey {
    case screen
  }
}
