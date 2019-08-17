//
//  FundsRisk.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit

extension FundsScreen {
    enum Risk: Int, CaseIterable, Decodable {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        
        var color: UIColor {
            switch self {
            case .one:
                return UIColor.Santander.pastelGreen
            case .two:
                return UIColor.Santander.emerald
            case .three:
                return UIColor.Santander.lightningYellow
            case .four:
                return UIColor.Santander.burningOrange
            case .five:
                return UIColor.Santander.redOrange
            }
        }
    }
}
