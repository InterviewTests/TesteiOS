//
//  InvestmentAPI.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Moya

class InvestmentAPI: InvestmentStoreProtocol {
    
    private let provider = MoyaProvider<InvestmentTarget>()
    var cancelable: Cancellable?
    
    func getFunds(result: @escaping (Result<Investment.Funds.Response, Error>) -> Void) {
        cancelable?.cancel()
        cancelable = provider.request(.getFunds, decodeType: Investment.Funds.Response.self) { responseResult in
            switch responseResult {
            case .success(let funds):
                result(.success(funds))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
