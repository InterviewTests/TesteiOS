//
//  UIFont+Ext.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
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
