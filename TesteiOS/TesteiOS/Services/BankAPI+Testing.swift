//
//  BankAPI+Testing.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation

extension BankAPI {
  var sampleData: Data {
    switch self {
    case .fetchForm:
      return stubbedResponse("Form")
    case .fetchFund:
      return stubbedResponse("Fund")
    }
  }
  
  func stubbedResponse(_ filename: String, bundle: Bundle = .main) -> Data! {
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
  }
}
