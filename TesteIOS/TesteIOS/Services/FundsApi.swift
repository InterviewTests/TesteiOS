//
//  FundsApi.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FundsApi: FundosStoreProtocol {
    func fetchFundo(completionHandler: @escaping (FundModel?, FundosStoreError?) -> Void) {
        let url = NetworkManager.baseURL + "fund.json"
        
        NetworkManager.requestURL(method: .get, url: url) { (response) in
            if let error = response.error {
                let error = FundosStoreError.CannotFetch(error.localizedDescription)
                completionHandler(nil, error)
                return
            }
            
            guard let data = response.data else {
                let error = FundosStoreError.CannotFetch("An error ocurred")
                completionHandler(nil, error)
                return
            }
            
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let jsonResult = jsonResult as? JSONDict {
                    if let screen = jsonResult["screen"] as? JSONDict {
                        let fund = FundModelFields(json: screen)
                        completionHandler(fund, nil)
                        return
                    }
                }
                
                let error = FundosStoreError.CannotFetch("An error ocurred")
                completionHandler(nil, error)
                return
            } catch let error {
                let error = FundosStoreError.CannotFetch(error.localizedDescription)
                completionHandler(nil, error)
                return
            }
        }
    }
}
