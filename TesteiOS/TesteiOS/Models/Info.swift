import Foundation

public struct Info: Codable {
  
  public let name: String
  public let data: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case data
  }
}
