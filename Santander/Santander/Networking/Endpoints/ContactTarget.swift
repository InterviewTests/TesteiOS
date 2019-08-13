//
//  ContactTarget.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Moya

enum ContactTarget {
    case getForm
}

extension ContactTarget: TargetType {
    
    var baseURL: URL {
        return try! ServerRoutes.baseRoute.asURL()
    }
    
    var path: String {
        switch self {
        case .getForm:
            return ServerRoutes.Contact.getForm
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getForm:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getForm:
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
