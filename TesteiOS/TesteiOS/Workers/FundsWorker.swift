//
//  FundsWorker.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

class FundsWorker
{
    var fundsStore: FundsStoreProtocol
    
    init(fundsStore: FundsStoreProtocol)
    {
        self.fundsStore = fundsStore
    }
    
    func fetchFunds(completionHandler: @escaping ([Fund]) -> Void)
    {
        fundsStore.fetchFunds { (funds: () throws -> [Fund]) -> Void in
            do {
                let funds = try funds()
                DispatchQueue.main.async {
                    completionHandler(funds)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler([])
                }
            }
        }
    }
}

// MARK: - Funds store API

protocol FundsStoreProtocol
{
    // MARK: Fetch operations - Optional error
    
    func fetchFunds(completionHandler: @escaping ([Fund], FundsStoreError?) -> Void)
    func fetchFund(completionHandler: @escaping (Fund?, FundsStoreError?) -> Void)
    
    // MARK: Fetch operations - Generic enum result type
    
    func fetchFunds(completionHandler: @escaping FundsStoreFetchFundsCompletionHandler)
    func fetchFund(completionHandler: @escaping FundsStoreFetchFundCompletionHandler)
    
    // MARK: Fetch operations - Inner closure
    
    func fetchFunds(completionHandler: @escaping (() throws -> [Fund]) -> Void)
    func fetchFund(completionHandler: @escaping (() throws -> Fund?) -> Void)
}

protocol FundsStoreUtilityProtocol {}

// MARK: - Funds store Fetch operation results

typealias FundsStoreFetchFundsCompletionHandler = (FundsStoreResult<[Fund]>) -> Void
typealias FundsStoreFetchFundCompletionHandler = (FundsStoreResult<Fund>) -> Void

enum FundsStoreResult<U>
{
    case Success(result: U)
    case Failure(error: FundsStoreError)
}

// MARK: - Funds store Fetch operation errors

enum FundsStoreError: Equatable, Error
{
    case CannotFetch(String)
}

func ==(lhs: FundsStoreError, rhs: FundsStoreError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    default: return false
    }
}
