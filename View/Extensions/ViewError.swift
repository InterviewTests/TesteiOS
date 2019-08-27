//
//  ViewError.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 18/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation

enum ViewError: Error {
    case formIncomplete(String)
    case formInvalid(String)
}


extension ViewError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .formIncomplete:
            return "There are incomplete required fields. Please complete them."
        case .formInvalid(let fieldName):
            return "Invalid value for field \(fieldName)"
        }
    }
}
