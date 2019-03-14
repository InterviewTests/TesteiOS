//
//  NetworkManager.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum APIEnvironment {
  case staging
  case qa
  case production
}

protocol Networkable {
  var provider: MoyaProvider<BankAPI> { get }
  func fetchForm(request: Contact.Form.Request, completion: @escaping (Result<FormData>) -> ())
  func fetchFund(request: Funds.Get.Request, completion: @escaping (Result<FundsData>) -> ())
}

struct NetworkManager: Networkable {
  let provider = MoyaProvider<BankAPI>(manager: DefaultAlamofireManager.sharedManager, plugins: [NetworkLoggerPlugin(verbose: true)])
  static let environment: APIEnvironment = .staging
  
  func fetchForm(request: Contact.Form.Request, completion: @escaping (Result<FormData>) -> ()) {
    provider.request(.fetchForm) { result in
      switch result {
      case .success(let response):
        do {
          let formData = try JSONDecoder().decode(FormData.self, from: response.data)
          completion(Result.success(formData))
        } catch let error {
          fatalError("data could not be decoded: \(error)")
        }
      case .failure(let error):
        completion(Result.failure(error))
      }
    }
  }
  
  func fetchFund(request: Funds.Get.Request, completion: @escaping (Result<FundsData>) -> ()) {
    provider.request(.fetchFund) { result in
      switch result {
      case .success(let response):
        do {
          let fundsData = try JSONDecoder().decode(FundsData.self, from: response.data)
          completion(Result.success(fundsData))
        } catch let error {
          fatalError("data could not be decoded: \(error)")
        }
      case .failure(let error):
        completion(Result.failure(error))
      }
    }
  }
}
