//
//  ServiceError.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 10/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import Moya

public struct BusinessError: Codable, Error {
  var code: String?
  var text: String?
  var title: String?
}

public enum ServiceError: Swift.Error {
  case businessError(BusinessError)
  case moyaError(MoyaError)
}

public struct ErrorViewModel {
  var title: String?
  var buttonTitles: [String]?
}
