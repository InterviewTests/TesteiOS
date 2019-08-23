//
//  TestError.swift
//  SantanderUnitTests
//
//  Created by Orlando Amorim on 23/08/19.
//

import Foundation

enum TestError: Error, LocalizedError {
    
    case contact
    case investment
    
    public var errorDescription: String? {
        switch self {
        case .contact:
            return NSLocalizedString("Contact Error", comment: "Contact Error")
        case .investment:
            return NSLocalizedString("Investment Error", comment: "Investment Error")
        }
    }
}
