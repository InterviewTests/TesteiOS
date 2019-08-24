//
//  FormService.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct FormService {
    static func getForm(completion: @escaping (Result<FormFormat, Error>) -> ()) {
        Service<FormFormat>().get(url: EndPoint.form) { (result) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let form):
                completion(.success(form))
            }
        }
    }
}
