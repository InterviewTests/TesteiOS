//
//  FundAPI.swift
//  DesafioSantander
//
//  Created by Fernanda de Lima on 30/09/18.
//  Copyright © 2018 FeLima. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


protocol FundAPIProtocol{
    func fetch(completion: @escaping (FundModal) -> Void)
    func fetch()
    var delegate: FundAPIDelegate? { get set }
}

protocol FundAPIDelegate{
    func fundAPI(fundAPI: FundAPIProtocol, didFetchFund fund: FundModal)
}

class FundAPI: FundAPIProtocol{
    var delegate: FundAPIDelegate?
    
    func fetch(completion: @escaping (FundModal) -> Void) {
        Alamofire
            .request(Endpoints.fund.fund.url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<FundModal>) in
                switch response.result {
                case .success(let screen):
                    print("==========> SAIDA")
                    print(screen)
                    completion(screen)
                    
                case .failure( _):
                    let screen = FundModal(screen: nil)
                    completion(screen)
                }
            })
    }
    
    func fetch() {
        Alamofire
            .request(Endpoints.fund.fund.url, method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<FundModal>) in
                switch response.result {
                case .success(let screen):
                    print("==========> SAIDA")
                    print(screen)
                    self.delegate?.fundAPI(fundAPI: self, didFetchFund: screen)
                    
                case .failure( _):
                    let screen = FundModal(screen: nil)
                    self.delegate?.fundAPI(fundAPI: self, didFetchFund: screen)
                }
            })
    }
}
