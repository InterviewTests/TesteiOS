//
//  Number+ext.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 26/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation


extension Double {
    public func formatAsPercentage() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return (formatter.string(from: self as NSNumber) ?? String(format: "%.2f", self)) + "%"
    }
}
