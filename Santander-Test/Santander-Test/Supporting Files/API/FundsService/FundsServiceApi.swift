//
//  FundsServiceApi.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 13/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Moya

enum FundsServiceApi {
    case getFormCellsList
    case getFundsList
}

extension FundsServiceApi: TargetType {
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getFormCellsList:
            return "/cells.json"
        case .getFundsList:
            return "/fund.json"
        }
    }
    
    var method: Method {
        switch self {
        case .getFormCellsList,
             .getFundsList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getFormCellsList,
             .getFundsList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getFormCellsList,
             .getFundsList:
            return ["content-type": "application/json"]
        }
    }
    
    
}
