//
//  SendButton.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 16/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

protocol SendButtonDelegate: class {
    func buttonPressed()
}

class SendButton: UIButton {
    
    weak var delegate: SendButtonDelegate?
    
    private var originalWidth: CGFloat = 0
    private var originalHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        backgroundColor = UIColor.darkRedColor
        layer.cornerRadius = 25
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        originalWidth = frame.size.width
        originalHeight = frame.size.height
        
        let buttonCenter = center
        frame.size = CGSize(width: originalWidth * 0.9, height: originalHeight * 0.9)
        center = buttonCenter
        layer.cornerRadius = 22.5
        backgroundColor = UIColor.lightRedColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let buttonCenter = center
        frame.size = CGSize(width: originalWidth, height: originalHeight)
        center = buttonCenter
        layer.cornerRadius = 25
        backgroundColor = UIColor.darkRedColor
        delegate?.buttonPressed()
    }
}
