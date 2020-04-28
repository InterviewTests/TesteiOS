//
//  RedRoundedButton.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 27/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RedRoundedButton: UIButton {
    // MARK: - Override Variables
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.9215686275, green: 0.462745098, blue: 0.462745098, alpha: 1) : #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
        }
    }
    
    // MARK: - Initialization
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        configureUI()
    }

    // MARK: - Private Methods
    fileprivate func configureUI() {
        self.layer.cornerRadius = (self.frame.height / 2)
        
        backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "DINPro-Medium", size: 16)
    }
}
