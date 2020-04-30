//
//  UIView+InnerBorder.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

extension UIView {

    fileprivate var bezierPathIdentifier:String { return "bezierPathBorderLayer" }

    fileprivate var bezierPathBorder:CAShapeLayer? {
        return (self.layer.sublayers?.filter({ (layer) -> Bool in
            return layer.name == self.bezierPathIdentifier && (layer as? CAShapeLayer) != nil
        }) as? [CAShapeLayer])?.first
    }

    func bezierPathBorder(_ color:UIColor = .white, width:CGFloat = 1) {

        var border = self.bezierPathBorder
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius:self.layer.cornerRadius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask

        if (border == nil) {
            border = CAShapeLayer()
            border!.name = self.bezierPathIdentifier
            self.layer.addSublayer(border!)
        }

        border!.frame = self.bounds
        let pathUsingCorrectInsetIfAny =
            UIBezierPath(roundedRect: border!.bounds, cornerRadius:self.layer.cornerRadius)

        border!.path = pathUsingCorrectInsetIfAny.cgPath
        border!.fillColor = UIColor.clear.cgColor
        border!.strokeColor = color.cgColor
        border!.lineWidth = width * 2
    }

    func removeBezierPathBorder() {
        self.layer.mask = nil
        self.bezierPathBorder?.removeFromSuperlayer()
    }
}
