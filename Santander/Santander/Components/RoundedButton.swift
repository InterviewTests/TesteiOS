//
//  RoundedButton.swift
//
//  Created by Gabriel Vieira on 21/04/18.
//  Copyright © 2018 Gabriel Vieira. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.config()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.config()
    }
    
    private func config() {
        self.backgroundColor = Color.red
        self.layer.cornerRadius = 25
        self.layer.borderColor = UIColor.white.cgColor
        guard let font = UIFont(name: "DINPro-Medium", size: 16) else { return }
        self.titleLabel?.font = font
        self.setTitleColor(Color.white, for: .normal)
    }
}
