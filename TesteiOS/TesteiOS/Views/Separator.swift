//
//  Separator.swift
//  TesteiOS
//
//  Created by Felipe Borges on 08/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

@IBDesignable class Separator: UIView {
    
    let lineWidth: CGFloat = 3.0
    let halfPyramidBase: CGFloat = 7.0
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    override func draw(_ rect: CGRect) {
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setShouldAntialias(true)
        }
        
        let path = UIBezierPath()
        let thinnerPath = UIBezierPath()

        path.lineWidth = lineWidth
        thinnerPath.lineWidth = lineWidth/2
        
        path.move(to: .zero)

        path.addLine(to: CGPoint(x: halfWidth - halfPyramidBase, y: 0))
        thinnerPath.move(to: CGPoint(x: halfWidth - halfPyramidBase, y: 0))
        thinnerPath.addLine(to: CGPoint(x: halfWidth, y: rect.height))
        thinnerPath.addLine(to: CGPoint(x: halfWidth + halfPyramidBase, y: 0))
        path.move(to: CGPoint(x: halfWidth + halfPyramidBase, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))


        UIColor.CustomColor.lightGrayishOrange.setStroke()

        path.stroke()
        thinnerPath.stroke()
    }
}
