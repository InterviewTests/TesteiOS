//
//  FundsAPI.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

class FundsAPI: FundsStoreProtocol, FundsStoreUtilityProtocol {
    
    // MARK: - Data
    
    var fund: Fund? = nil
    var funds:[Fund] {
        if let fundAux: Fund = self.fund {
            return [fundAux]
        }
        return []
    }
    
    // MARK: - Object lifecycle
    
    init() {
        self.fetch()
    }
    
    func fetch () {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            let jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonString ?? "Erro")
            do {
                let decoder = JSONDecoder()
                let fundContainer = try decoder.decode(FundContainer.self, from: data!)
                self.fund = fundContainer.fund
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    // MARK: - Fetch operations - Optional error
    
    func fetchFunds(completionHandler: @escaping ([Fund], FundsStoreError?) -> Void) {
        completionHandler(self.funds, nil)
    }
    
    func fetchFund(completionHandler: @escaping (Fund?, FundsStoreError?) -> Void){
        if let fundAux: Fund = self.fund {
            completionHandler(fundAux, nil)
        } else {
            completionHandler(nil, FundsStoreError.CannotFetch("Cannot fetch fund"))
        }
    }
    
    // MARK: - Fetch operations - Generic enum result type
    
    func fetchFunds(completionHandler: @escaping FundsStoreFetchFundsCompletionHandler) {
        completionHandler(FundsStoreResult.Success(result: self.funds))
    }
    
    func fetchFund(completionHandler: @escaping FundsStoreFetchFundCompletionHandler) {
        if let fundAux: Fund = self.fund {
            completionHandler(FundsStoreResult.Success(result: fundAux))
        } else {
            completionHandler(FundsStoreResult.Failure(error: FundsStoreError.CannotFetch("Cannot fetch fund")))
        }
    }
    
    // MARK: - Fetch operations - Inner closure
    
    func fetchFunds(completionHandler: @escaping (() throws -> [Fund]) -> Void) {
        completionHandler { return self.funds }
    }
    
    func fetchFund(completionHandler: @escaping (() throws -> Fund?) -> Void) {
        if let fundAux: Fund = self.fund {
            completionHandler { return fundAux }
        } else {
            completionHandler { throw FundsStoreError.CannotFetch("Cannot fetch fund") }
        }
    }
}
