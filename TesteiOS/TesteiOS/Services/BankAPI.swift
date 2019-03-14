//
//  BankAPI.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import Moya

enum BankAPI {
  case fetchForm
  case fetchFund
}

extension BankAPI: TargetType {
  var environmentBaseURL: String {
    switch NetworkManager.environment {
    case .staging:
      return "https://floating-mountain-50292.herokuapp.com"
    case .qa:
      return ""
    case .production:
      return ""
    }
  }
  
  var baseURL: URL {
    guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
    return url
  }
  
  var path: String {
    switch self {
    case .fetchForm:
      return "/cells.json"
    case .fetchFund:
      return "/fund.json"
    }
  }
  
  var method: Moya.Method {
    switch self {
    default:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    default:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    switch self {
    default:
      return ["Content-type":"application/json"]
    }
  }
}
