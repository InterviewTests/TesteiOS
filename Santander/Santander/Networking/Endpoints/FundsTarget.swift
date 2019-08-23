//
//  FundsTarget.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Moya

enum InvestmentTarget {
    case getFunds
}

extension InvestmentTarget: TargetType {

    var baseURL: URL {
        return try! ServerRoutes.baseRoute.asURL()
    }
    
    var path: String {
        switch self {
        case .getFunds:
            return ServerRoutes.Investment.getFunds
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFunds:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getFunds:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var headers: [String : String]? {
        return nil
    }
}
