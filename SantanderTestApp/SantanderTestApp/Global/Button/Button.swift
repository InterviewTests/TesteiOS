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
    
    var isBeingPressed: Bool = false
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
    }
    
    private func commonInit() {
        isEnabled = true
        isUserInteractionEnabled = true
        backgroundColor = UIColor._red
        
        titleLabel?.font = R.font.dinProMedium(size: 16)
        setTitleColor(UIColor.white, for: .normal)
        
        self.addTarget(self, action: #selector(pressButton), for: [.touchDown, .touchDragEnter])
        self.addTarget(self, action: #selector(releaseButton), for: [.touchUpInside, .touchUpOutside, .touchDragExit, .touchCancel, .touchDragOutside])
    }
    
    let animationDuration = 0.05
    
    @objc func pressButton() {
        guard !isBeingPressed else {
            return
        }
        
        isBeingPressed = true
        backgroundColor = UIColor._peach
        
        UIView.animate(withDuration: animationDuration) {
            self.transform = self.transform.scaledBy(x: 0.92, y: 0.9)
        }
    }
    
    @objc func releaseButton() {
        guard isBeingPressed else {
            return
        }
        
        isBeingPressed = false
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + animationDuration) {
            self.backgroundColor = UIColor._red
        }
        
        UIView.animate(withDuration: animationDuration) {
            self.transform = .identity
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 315, height: 50)
    }
    
}
