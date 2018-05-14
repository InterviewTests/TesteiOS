//
//  MoyaProviderExtension.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 10/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import Moya
import Result

extension MoyaProvider {
  
  @discardableResult
  open func requestCodableObject<CodableObject: Codable>(_ target: Target, queue: DispatchQueue? = nil, progress: Moya.ProgressBlock? = nil, onSuccess: @escaping (CodableObject) -> Void, onFailure: @escaping (ServiceError) -> Void) -> Cancellable {
    
    return request(target, callbackQueue: queue, progress: progress, completion: { (result) in
      switch result {
      case .success(let response):
        let data = response.data
        
        print(target.baseURL.absoluteString + target.path)
        switch response.statusCode {
        case 200..<300:
          do {
            let responseObject = try JSONDecoder().decode(CodableObject.self, from: data)
            onSuccess(responseObject)
          } catch {
            onFailure((ServiceError.businessError(BusinessError(code: nil, text: "Ocorreu um erro inesperado. Tente novamente mais tarde", title: "Oo"))))
          }
          
        default:
          do {
            let responseObject = try JSONDecoder().decode(BusinessError.self, from: data)
            onFailure(ServiceError.businessError(responseObject))
          } catch {
            onFailure(ServiceError.moyaError(MoyaError.jsonMapping(response)))
          }
        }
        
      case .failure(let err):
        onFailure(ServiceError.moyaError(err))
      }
    
    })
    
  }
  
}
