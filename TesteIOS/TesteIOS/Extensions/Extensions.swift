//
//  Extensions.swift
//  TesteIOS
//
//  Created by Sidney Silva on 14/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

extension String{
    func getOnlyDigits() -> String{
        let strings = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted)
        let digitOnlyString = strings.joined(separator: "")
        return digitOnlyString
    }
}
