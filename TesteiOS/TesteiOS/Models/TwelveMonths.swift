import Foundation

public struct TwelveMonths: Codable {
  
  public let fund: Double?
  public let CDI: Double?
  
  enum CodingKeys: String, CodingKey {
    case fund
    case CDI
  }
}
