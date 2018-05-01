//
//  CustomButton.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CustomButton {
    open override var isHighlighted: Bool {
        didSet {
            let color = isHighlighted ? UIColor.selectedRed : UIColor.redError
            backgroundColor = color
        }
    }
}
