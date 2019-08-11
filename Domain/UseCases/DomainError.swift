//
//  DomainError.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 10/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation

public enum DomainError: Error {
    case invalidCellType
    case invalidFieldType
}


extension DomainError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidCellType:
            return "Cell Type not identified"
        case .invalidFieldType:
            return "Field Type not identified"
        }
    }
}
