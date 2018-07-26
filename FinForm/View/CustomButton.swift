//
//  CustomButton.swift
//  FinForm
//
//  Created by Gustavo on 26/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addTarget(self, action: #selector(pressedAnimation), for: UIControlEvents.touchDown)
        self.addTarget(self, action: #selector(unpressedAnimation), for: UIControlEvents.touchUpInside)
        self.addTarget(self, action: #selector(unpressedAnimation), for: UIControlEvents.touchUpOutside)
        configure()
    }
    
    @objc private func pressedAnimation(){
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            self.alpha = 0.5
        }
    }
    
    @objc private func unpressedAnimation(){
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.alpha = 1
        }
    }
    
    private func configure()
    {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }

}
