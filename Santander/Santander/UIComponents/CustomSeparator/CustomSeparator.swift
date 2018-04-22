//
//  CustomSeparator.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class CustomSeparator: UIView {
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    func setupView() {
        let path = UIBezierPath()
        
        let defaultYPosition = ((self.frame.height/2) - 0.5)
        let centerX = (self.frame.width/2)
        let firstX = centerX - 10
        let secondX = centerX + 10
        let heightY = defaultYPosition + 10
        
        path.move(to: CGPoint(x: 0, y: defaultYPosition))
        path.addLine(to: CGPoint(x: firstX, y: defaultYPosition))
        path.addLine(to: CGPoint(x: centerX, y: heightY))
        path.addLine(to: CGPoint(x: secondX, y: defaultYPosition))
        path.addLine(to: CGPoint(x: self.frame.width, y: defaultYPosition))
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = Color.lightGray.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1.0

        self.layer.addSublayer(shapeLayer)
    }
}
