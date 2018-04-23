//
//  InvestmentEndpoint
//  NetworkLayer
//
//  Created by Matheus Weber on 30/03/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

public enum InvestmentAPI {
    case cells
    case fund
}

extension InvestmentAPI: EndPointType {
    
    var environmentBaseURL : String {
        return "https://floating-mountain-50292.herokuapp.com/"
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .cells:
            return "cells.json"
        case .fund:
            return "fund.json"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


