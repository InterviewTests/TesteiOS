//
//  Checkbox.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 31/05/18.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

class Checkbox:UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            titleLabel?.minimumScaleFactor = 0.5
            titleLabel?.numberOfLines = 1
            titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
            titleLabel?.adjustsFontSizeToFitWidth = true
        }
    
    func setSelected() {
        isSelected = !isSelected
    }
    }

