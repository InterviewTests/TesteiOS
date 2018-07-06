//
//  Line.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/29/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit


@IBDesignable class Line: UIView {
    
    @IBInspectable var lineColor : UIColor = UIColor.lightGray
    @IBInspectable var lineThickness : CGFloat = 1.0
    
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineWidth(lineThickness)
        context.setStrokeColor(lineColor.cgColor)
        
        let startingPoint = CGPoint(x: 0.0, y: rect.midY)
        let endingPoint = CGPoint(x: rect.size.width, y: rect.midY)
        
        context.move(to: startingPoint)
        context.addLine(to: endingPoint)
        context.strokePath()
        
    }
    
    
}




