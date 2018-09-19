//
//  UIFont+Extension.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static func regularFont(of size: CGFloat) -> UIFont {
        if let font = UIFont(name: "Helvetica Neue", size: size) {
            return font
        }
        return UIFont()
    }
}
