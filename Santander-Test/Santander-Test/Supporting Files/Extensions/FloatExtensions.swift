//
//  DoubleExtensions.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 20/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

extension Float {
    
    func getBrazilianPercentFormat() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        return formatter.string(from: self / 100 as NSNumber)
    }
    
}
