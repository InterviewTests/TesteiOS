//
//  Result.swift
//  SantanderInvestmentApp
//
//  Created by Michel de Sousa Carvalho on 23/05/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case error(Error?)
    case failureNetwork(NetworkErrorResponse)
}


extension Result {
    public init(_ value: T?, or error: Error) {
        if let value = value {
            self = .success(value)
        } else {
            self = .error(error)
        }
    }
    public var value: T? {
        guard case .success(let v) = self else { return nil}
        return v
    }
}
