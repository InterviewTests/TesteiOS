import Foundation

public struct Cell: Codable {
  
  public let id: Int?
  public let type: Int?
  public let message: String?
  //public let typefield:
  public let hidden: Bool?
  public let topSpacing: Double?
  public let show: Int?
  public let required: Bool?
  
  enum CodingKeys: String, CodingKey {
    case id
    case type
    case message
    //case typefield
    case hidden
    case topSpacing
    case show
    case required
  }
}

