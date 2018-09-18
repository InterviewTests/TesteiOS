//
//  Result.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failureNetwork(NetworkErrorResponse)
}


extension Result {
    public init(_ value: T?, or error: NetworkErrorResponse) {
        if let value = value {
            self = .success(value)
        } else {
            self = .failureNetwork(error)
        }
    }
    public var value: T? {
        guard case .success(let v) = self else { return nil}
        return v
    }
}
