//
//  RedButton.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 31/05/18.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import UIKit

class RedButton:UIButton {
    
    required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
        backgroundColor = .red
        layer.cornerRadius = 25
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
    }

    
    
}
