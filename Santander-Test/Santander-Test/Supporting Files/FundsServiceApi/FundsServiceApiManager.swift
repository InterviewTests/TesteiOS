//
//  FundsServiceApiManager.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Moya

class FundsServiceApiManager {
    
    static let shared = FundsServiceApiManager()
    
    private init() {}
    
    private let provider = MoyaProvider<FundsServiceApi>()
    
    func getCellsList(completion: @escaping (FormCellsList?, Error?) -> Void) {
        provider.request(.getFormCellsList) { (response) in
            switch response {
            case .success(let value):
                do {
                    let formCellsList: FormCellsList = try JSONDecoder().decode(FormCellsList.self, from: value.data)
                    completion(formCellsList, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func getFundsList(completion: @escaping (FundsList?, Error?) -> Void) {
        provider.request(.getFundsList) { (response) in
            switch response {
            case .success(let value):
                do {
                    let fundsList: FundsList = try JSONDecoder().decode(FundsList.self, from: value.data)
                    completion(fundsList, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}
