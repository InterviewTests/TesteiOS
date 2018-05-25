//
//  Button.swift
//  SantanderTestApp
//
//  Created by Frederico Franco on 24/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class Button: UIButton {
    
    override var isSelected: Bool {
        willSet {
            self.isSelected = newValue
            
            toggleSelectedState()
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        isEnabled = true
        isUserInteractionEnabled = true
        backgroundColor = UIColor._red
        layer.cornerRadius = 25
        
        titleLabel?.font = R.font.dinProMedium(size: 16)
        setTitleColor(UIColor.white, for: .normal)
    }
    
    private func toggleSelectedState() {
        if isSelected {
            backgroundColor = UIColor._red
        } else {
            backgroundColor = UIColor._peach
        }
    }
    
//    override var intrinsicContentSize: CGSize {
//        if isSelected {
//            return CGSize(width: 315, height: 50)
//        } else {
//            return CGSize(width: 284, height: 45)
//        }
//    }
    
}
