//
//  FundService.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct FundService {
    static func getScreen() {
        Service<Fund>().get(url: EndPoint.screen) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let fund):
                print(fund.screen.title!)
            }
        }
    }
}
