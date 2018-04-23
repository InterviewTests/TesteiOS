//
//  CardView.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class CardView: UIView {
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        setupBorder()
    }
}

//MARK: Methods
extension CardView {
    func setupBorder() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.cardSeparatorLightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
