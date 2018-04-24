import Foundation

public struct Cells: Codable {
  
  public let cells: [Cell]

  enum CodingKeys: String, CodingKey {
    case cells
  }
}
