//
//  HTTPEnvironment.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation


enum HTTPEnvironment {
    case dev
    
    public var host : String {
        switch self {
        case .dev:
            return "https://floating-mountain-50292.herokuapp.com/"
        }
    }
}
