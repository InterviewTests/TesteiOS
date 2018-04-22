//
//  APIClient.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import Foundation

protocol APIClientProtocol
{
    func fetchFormCells(completionHandler: @escaping (FormCells?, Error?) -> Void)
    func fetchFund(completionHandler: @escaping (Fund?, Error?) -> Void)
}

class APIClient: APIClientProtocol {
    
    func fetchFormCells(completionHandler: @escaping (FormCells?, Error?) -> Void) {
        let url = APIRouter.formCells()
        BaseAPIClient.request(url: url , ofType: FormCells.self) { (formCells, error) in
            completionHandler(formCells, error)
        }
    }

    func fetchFund(completionHandler: @escaping (Fund?, Error?) -> Void) {
        let url = APIRouter.Fund()
        BaseAPIClient.request(url: url , ofType: Fund.self) { (fund, error) in
            completionHandler(fund, error)
        }
    }
}
