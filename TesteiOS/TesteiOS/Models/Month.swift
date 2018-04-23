import Foundation

public struct Month: Codable {
  
  public let fund: Double?
  public let CDI: Double?
 
  enum CodingKeys: String, CodingKey {
    case fund
    case CDI
  }
}
