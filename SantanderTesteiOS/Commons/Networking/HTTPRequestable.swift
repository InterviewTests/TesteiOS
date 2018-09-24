//
//  HTTPRequestable.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation

protocol HTTPRequestable : HTTPDomain {
    
    var path : String { get }
    
    var url  : URL { get }
    
    var params : [String : Any] { get }
}

extension HTTPRequestable {
    
    var headers : [String : String] {
        return ["Content-Type" : "application/json", "Accept" : "application/json"]
    }
}
