//
//  FloatExtension.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 29/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import Foundation

extension Float
{
    var asPercent: String?
    {
        let formatter: NumberFormatter = .init()
        formatter.locale = .init(identifier: "PT-BR")
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1
        formatter.numberStyle = .percent
        
        return formatter.string(from: .init(value: self))
    }
}
