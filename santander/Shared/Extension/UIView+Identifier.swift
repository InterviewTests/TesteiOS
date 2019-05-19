//
//  UIView+Identifier.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

extension UIView {
    
    static var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
}
