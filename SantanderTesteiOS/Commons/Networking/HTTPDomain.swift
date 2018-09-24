//
//  HTTPDomain.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation


protocol HTTPDomain {
    var environment : HTTPEnvironment { get }
}

extension HTTPDomain {
    
    var environment : HTTPEnvironment {
        return .dev
    }
}
