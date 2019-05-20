//
//  BaseURL.swift
//  santander
//
//  Created by Jonatha Lima on 20/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

public struct BaseURL {
    
    static let shared = BaseURL()
    
    public var url: URLComponents
    
    private init() {
        url = URLComponents()
        url.scheme = "https"
        url.host = "floating-mountain-50292.herokuapp.com"
    }
    
}
