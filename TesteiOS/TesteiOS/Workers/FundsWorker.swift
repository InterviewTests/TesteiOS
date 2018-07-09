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
    
    func createFund(fundToCreate: Fund, completionHandler: @escaping (Fund?) -> Void)
    {
        fundsStore.createFund(fundToCreate: fundToCreate) { (fund: () throws -> Fund?) -> Void in
            do {
                let fund = try fund()
                DispatchQueue.main.async {
                    completionHandler(fund)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
    
    func updateFund(fundToUpdate: Fund, completionHandler: @escaping (Fund?) -> Void)
    {
        fundsStore.updateFund(fundToUpdate: fundToUpdate) { (fund: () throws -> Fund?) in
            do {
                let fund = try fund()
                DispatchQueue.main.async {
                    completionHandler(fund)
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
    }
}

// MARK: - Funds store API

protocol FundsStoreProtocol
{
    // MARK: CRUD operations - Optional error
    
    func fetchFunds(completionHandler: @escaping ([Fund], FundsStoreError?) -> Void)
    func fetchFund(completionHandler: @escaping (Fund?, FundsStoreError?) -> Void)
    func createFund(fundToCreate: Fund, completionHandler: @escaping (Fund?, FundsStoreError?) -> Void)
    func updateFund(fundToUpdate: Fund, completionHandler: @escaping (Fund?, FundsStoreError?) -> Void)
    func deleteFund(id: String, completionHandler: @escaping (Fund?, FundsStoreError?) -> Void)
    
    // MARK: CRUD operations - Generic enum result type
    
    func fetchFunds(completionHandler: @escaping FundsStoreFetchFundsCompletionHandler)
    func fetchFund(completionHandler: @escaping FundsStoreFetchFundCompletionHandler)
    func createFund(fundToCreate: Fund, completionHandler: @escaping FundsStoreCreateFundCompletionHandler)
    func updateFund(fundToUpdate: Fund, completionHandler: @escaping FundsStoreUpdateFundCompletionHandler)
    func deleteFund(id: String, completionHandler: @escaping FundsStoreDeleteFundCompletionHandler)
    
    // MARK: CRUD operations - Inner closure
    
    func fetchFunds(completionHandler: @escaping (() throws -> [Fund]) -> Void)
    func fetchFund(completionHandler: @escaping (() throws -> Fund?) -> Void)
    func createFund(fundToCreate: Fund, completionHandler: @escaping (() throws -> Fund?) -> Void)
    func updateFund(fundToUpdate: Fund, completionHandler: @escaping (() throws -> Fund?) -> Void)
    func deleteFund(id: String, completionHandler: @escaping (() throws -> Fund?) -> Void)
}

protocol FundsStoreUtilityProtocol {}

// MARK: - Funds store CRUD operation results

typealias FundsStoreFetchFundsCompletionHandler = (FundsStoreResult<[Fund]>) -> Void
typealias FundsStoreFetchFundCompletionHandler = (FundsStoreResult<Fund>) -> Void
typealias FundsStoreCreateFundCompletionHandler = (FundsStoreResult<Fund>) -> Void
typealias FundsStoreUpdateFundCompletionHandler = (FundsStoreResult<Fund>) -> Void
typealias FundsStoreDeleteFundCompletionHandler = (FundsStoreResult<Fund>) -> Void

enum FundsStoreResult<U>
{
    case Success(result: U)
    case Failure(error: FundsStoreError)
}

// MARK: - Funds store CRUD operation errors

enum FundsStoreError: Equatable, Error
{
    case CannotFetch(String)
    case CannotCreate(String)
    case CannotUpdate(String)
    case CannotDelete(String)
}

func ==(lhs: FundsStoreError, rhs: FundsStoreError) -> Bool
{
    switch (lhs, rhs) {
    case (.CannotFetch(let a), .CannotFetch(let b)) where a == b: return true
    case (.CannotCreate(let a), .CannotCreate(let b)) where a == b: return true
    case (.CannotUpdate(let a), .CannotUpdate(let b)) where a == b: return true
    case (.CannotDelete(let a), .CannotDelete(let b)) where a == b: return true
    default: return false
    }
}
