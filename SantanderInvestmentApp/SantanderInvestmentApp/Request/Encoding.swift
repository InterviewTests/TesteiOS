//
//  Encoding.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

public protocol Encoding {
    func encode(params:[String: Any]) -> Data?
    func encode(params: [Any]) -> Data?
}

extension Encoding {
    public func encode(params: [Any]) -> Data? { return nil }
}

public struct URLTypeEncoding: Encoding {
    
    public func encode(params:[String: Any]) -> Data? {
        guard let jsonData = params.queryFormat().data(using: .utf8, allowLossyConversion: false) else {
            return nil
        }
        return jsonData
    }
}

public struct JSONTypeEncoding: Encoding {
    
    public let options: JSONSerialization.WritingOptions
    
    public init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }
    
    public func encode(params:[String: Any]) -> Data? {
        
        guard let data = try? JSONSerialization.data(withJSONObject: params, options: options) else {
            return nil
        }
        
        return data
    }
    
    public func encode(params: [Any]) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: params, options: options) else {
            return nil
        }
        return data
    }
}

