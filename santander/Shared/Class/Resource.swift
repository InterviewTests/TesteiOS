//
//  Resource.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

struct Resource {
    
    internal enum Font: String {
        case black = "DINPro-Black"
        case bold = "DINPro-Bold"
        case light = "DINPro-Light"
        case medium = "DINPro-Medium"
        case regular = "DINPro-Regular"
        
        func of(size: CGFloat) -> UIFont {
            guard let font = UIFont(name: self.rawValue, size: size) else {
                fatalError("The font named \(self.rawValue) was not found!")
            }
            return font
        }
    }
    
}
