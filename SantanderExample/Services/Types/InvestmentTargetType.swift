//
//  InvestmentTargetType.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 10/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit
import Moya

enum InvestmentTargetType {
  case getInvestment()
}

extension InvestmentTargetType: TargetType {
  var baseURL: URL {
    guard let url =  URL(string: "https://floating-mountain-50292.herokuapp.com") else {
      fatalError("No url with this string")
    }
    return url
  }
  
  var path: String { return "/fund.json" }
  
  var method: Moya.Method {
    return .get
  }
  
  // For mock porpose
  var sampleData: Data {
    return Data(fromFileWithName: "InvestmentMock", ofType: "json") ?? Data()
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String : String]? {
    return [:]
  }
}
