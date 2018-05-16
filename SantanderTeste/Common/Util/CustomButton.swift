//
//  CustomButton.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 14/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                alpha = 0.5
            } else {
                alpha = 1.0
            }
            
            layoutIfNeeded()
        }
    }
}
