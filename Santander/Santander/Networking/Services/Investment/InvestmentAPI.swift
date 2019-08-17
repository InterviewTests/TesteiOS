//
//  InvestmentAPI.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Moya
import RxSwift

class InvestmentAPI: InvestmentStoreProtocol {
    
    private let provider = MoyaProvider<InvestmentTarget>()
    var disposeBag: DisposeBag = DisposeBag()
    
    func getFunds(result: @escaping (Result<Investment.Funds.Response, Error>) -> Void) {
        disposeBag = DisposeBag()
        provider.rx.request(.getFunds).map(Investment.Funds.Response.self).asObservable().subscribe(onNext: { funds in
            result(.success(funds))
        }, onError: { error in
            result(.failure(error))
        }).disposed(by: disposeBag)
    }
}
