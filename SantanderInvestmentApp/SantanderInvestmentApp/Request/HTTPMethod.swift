//
//  HTTPMethod.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: AnyObject]


enum HttpMethod<Body> {
    case get(data: Body?)
    case post(data: Body)
}

extension HttpMethod {
    var method: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }
    

    func map<B>(f: (Body) -> B) -> HttpMethod<B> {
        switch self {
        case .get(let data):
            guard let data = data else {
                return .get(data: nil)
            }
            return .get(data: f(data))

        case .post(let data): return .post(data: f(data))
        }
    }
    
}


