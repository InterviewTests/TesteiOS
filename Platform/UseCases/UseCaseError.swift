//
//  UseCaseError.swift
//  Platform
//
//  Created by Erika de Almeida Segatto on 10/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation

enum UseCaseError: Error {
    case invalidField(String, Any?)
    case invalidAttribute(String, Any?)
}

extension UseCaseError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidField(let fieldname, let json):
            return "invalid field '\(fieldname)' in json \(String(describing: json))"
        case .invalidAttribute(let fieldname, let json):
            return "invalid field '\(fieldname)' in json \(String(describing: json))"
        }
    }
}
