import Foundation

import Foundation

public struct MoreInfo: Codable {
  
  public let month: Month
  public let year: Year
  public let twelveMonths: TwelveMonths
  
  enum CodingKeys: String, CodingKey {
    case month
    case year
    case twelveMonths = "12months"
  }
}

