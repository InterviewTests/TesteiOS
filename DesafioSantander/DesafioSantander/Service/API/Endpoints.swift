//
//  Endpoints.swift
//  Bebida-Fractal
//
//  Created by Fernanda de Lima on 13/12/2017.
//  Copyright © 2017 Empresinha. All rights reserved.
//

import Foundation

import Foundation

struct API {
    static let baseUrl = "https://floating-mountain-50292.herokuapp.com/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum cell: Endpoint {
        case cell
        
        public var path: String {
            switch self {
            case .cell: return "cells.json"
            }
        }
        
        public var url: String {
            switch self {
            case .cell: return "\(API.baseUrl)\(path)"
            }
        }
    }
    
    enum fund: Endpoint {
        case fund
        
        public var path: String {
            switch self {
            case .fund: return "fund.json"
            }
        }
        
        public var url: String {
            switch self {
            case .fund: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
