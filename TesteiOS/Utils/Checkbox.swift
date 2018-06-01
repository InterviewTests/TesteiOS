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
        
        }
    
    init() {
        super.init(frame: .zero)
        titleLabel?.minimumScaleFactor = 0.5
        titleLabel?.numberOfLines = 1
        titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
        titleLabel?.adjustsFontSizeToFitWidth = true
        setImage(UIImage(named:"checkbox_checked"), for: UIControlState.selected)
        setImage(UIImage(named:"checkbox"), for: UIControlState.normal)
        
    }
    func setSelected() {
        isSelected = !isSelected
    }
    }

