//
//  Color.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    open class var lightGray: UIColor {
        return UIColor(red: 239/255.0, green: 238/255.0, blue: 237/255.0, alpha: 1.0)
    }
    
    open class var selectedGray: UIColor {
        return UIColor(red: 172/255.0, green: 172/255.0, blue: 172/255.0, alpha: 1.0)
    }
    
    open class var selectedRed: UIColor {
        return UIColor(red: 235/255.0, green: 118/255.0, blue: 118/255.0, alpha: 1.0)
    }
    
    open class var redError: UIColor {
        return UIColor(red: 1.0, green: 31/255.0, blue: 31/255.0, alpha: 1.0)
    }
    
    open class var greenAvailable: UIColor {
        return UIColor(red: 101/255.0, green: 190/255.0, blue: 48/255.0, alpha: 1.0)
    }
}
