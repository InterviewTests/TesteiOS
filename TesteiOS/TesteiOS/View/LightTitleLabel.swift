//
//  LightTitleLabel.swift
//  TesteiOS
//
//  Created by Nicolau on 15/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

@IBDesignable
class LightTitleLabel: UILabel {

    @IBInspectable var customFont: UIFont = UIFont.systemFont(ofSize: 15) {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }

    func updateView() {
        self.font = customFont
        layoutSubviews()
    }
    
}
