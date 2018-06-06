//
//  UncertainValue.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

public struct UncertainValue<T: Decodable, U: Decodable>: Decodable {
    public var tValue: T?
    public var uValue: U?
    
    public var value: Any? {
        return tValue ?? uValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        tValue = try? container.decode(T.self)
        uValue = try? container.decode(U.self)
        if tValue == nil && uValue == nil {
            //Type mismatch
            throw DecodingError.typeMismatch(type(of: self), DecodingError.Context(codingPath: [], debugDescription: "The value is not of type \(T.self) and not even \(U.self)"))
        }
        
    }
}
