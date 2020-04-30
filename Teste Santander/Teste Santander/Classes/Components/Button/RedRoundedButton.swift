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
            backgroundColor = isHighlighted ? ColorUtils.buttonSelectedRed : ColorUtils.buttonRed
        }
    }
    
    // MARK: - Initialization
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
        configureUI()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureUI()
    }

    // MARK: - Private Methods
    fileprivate func configureUI() {
        self.layer.cornerRadius = (self.frame.height / 2)
        
        backgroundColor = ColorUtils.buttonRed
        setTitleColor(.white, for: .normal)
        titleLabel?.font = FontUtils.mediumInfoTitle
    }
    
    // MARK: - Public Methods
    func setup(title: String) {
        setTitle(title, for: .normal)
    }
}
