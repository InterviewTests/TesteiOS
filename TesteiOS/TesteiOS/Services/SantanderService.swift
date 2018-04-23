
import Foundation
import RxSwift
import Moya


enum SantanderService {
  case fund
  case cells
}


// MARK: - TargetType Protocol Implementation
extension SantanderService: TargetType {
  var baseURL: URL { return URL(string: "https://floating-mountain-50292.herokuapp.com")! }
  var path: String {
    switch self {
    case .fund:
      return "/fund.json"
    case .cells:
      return "/cells.json"
    }
  }
  var method: Moya.Method {
    switch self {
    case .fund, .cells:
      return .get
    }
  }
  var task: Task {
    switch self {
    case .fund, .cells:
      return .requestPlain
    }
  }
  var sampleData: Data {
    switch self {
    case .fund, .cells:
      return "Half measures are as bad as nothing at all.".utf8Encoded
    }
  }
  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
}
// MARK: - Helpers
private extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
}
