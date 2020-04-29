//
//  InvestmentFundsWorker.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation
import Alamofire

class InvestmentFundsWorker {
    static func fetchInvestments(completion: @escaping(_ responseData: Data?) -> (), error: @escaping(_ error: Error?) -> ()) {
        let url = APIConstants.baseUrl + APIConstants.investmentEndpoint
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                completion(response.data)
                
                return
            }
            
            error(response.error)
        }
    }
}
