//
//  Extensions.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

extension UIColor{
    ///Unic colors for this app
    enum app{
        
        ///If color name does not exist it crashes the program in a good way
        fileprivate static func color(named: String) -> UIColor{
            let color = UIColor.init(named: named)
            assert(color != nil, "Color with name \(named) does not exist")
            return color!
        }
        
        //MARK: App unic colors
        public static var lvl1: UIColor{
            return color(named: "lvl1")
        }
        
        public static var lvl2: UIColor{
            return color(named: "lvl2")
        }
        
        public static var lvl3: UIColor{
            return color(named: "lvl3")
        }
        
        public static var CorrectInput: UIColor{
            return color(named: "CorrectInput")
        }
        
        public static var MainColor: UIColor{
            return color(named: "MainColor")
        }
        
        public static var PressedButton: UIColor{
            return color(named: "PressedButton")
        }
        
        public static var SelectedTab: UIColor{
            return color(named: "SelectedTab")
        }
    }
}

extension String{
    func digitsOnly() -> String{
        let stringArray = self.components(
            separatedBy: NSCharacterSet.decimalDigits.inverted)
        let newString = stringArray.joined(separator: "")
        
        return newString
    }
}
