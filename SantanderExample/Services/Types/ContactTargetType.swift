//
//  ContactTargetType.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import Moya

enum ContactTargetType {
  case getContactForms()
}

extension ContactTargetType: TargetType {
  var baseURL: URL {
    guard let url =  URL(string: "https://floating-mountain-50292.herokuapp.com") else {
      fatalError("No url with this string")
    }
    
    return url
  }
  
  var path: String {
    return "/cells.json"
  }
  
  var method: Moya.Method {
    return .get
  }
  
  // For mock objs
  var sampleData: Data {
    return Data(fromFileWithName: "ContactMock", ofType: "json") ?? Data()
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String : String]? {
    return [:]
  }
}
