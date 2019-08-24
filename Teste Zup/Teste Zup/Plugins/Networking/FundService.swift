//
//  FundService.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct FundService {
    static func getFund(completion: @escaping (Result<Fund, Error>) -> ()) {
        Service<Fund>().get(url: EndPoint.screen) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let fund):
                completion(.success(fund))
            }
        }
    }
}
