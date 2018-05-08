//
//  ResultHelper.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation
enum ResultHelper<T> {
    case success(Int, T)
    case error(Error)
}

extension ResultHelper {
    func map<U>(_ fnc:(T) -> U) -> ResultHelper<U>
    {
        switch self {
        case .success(let statusCode, let resultValue):
            let mappedResult = fnc(resultValue)
            return ResultHelper<U>.success(statusCode, mappedResult)
        case .error(let error):
            return ResultHelper<U>.error(error)
        }
    }
}

func extractStringFromData(data:Data) -> String {
    guard let convertedString = String(data: data, encoding: .utf8) else {
        return ""
    }
    
    return convertedString
}
