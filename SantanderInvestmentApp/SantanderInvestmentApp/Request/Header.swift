//
//  Header.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

public class Header {
    
    static func headerDefault(header: String) -> [String: String] {
        return ["Content-Type": header]
    }
}
