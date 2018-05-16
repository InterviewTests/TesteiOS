//
//  UIView.swift
//  CheckinCheckout
//
//  Created by Rafael Macito on 27/02/2018.
//  Copyright © 2018 Madeinweb. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    var currentFirstResponder: UIView? {
        if isFirstResponder {
            return self
        }
        
        for view in self.subviews {
            if let responder = view.currentFirstResponder {
                return responder
            }
        }
        
        return nil
    }
    
    var firstScrollView: UIView? {
        guard let superview = superview else { return nil }
        
        if superview.isKind(of: UIScrollView.self) {
            return superview
        } else {
            return superview.firstScrollView
        }
    }
    
    var visibleFrame: CGRect? {
        guard let superview = superview else { return nil }
        return frame.intersection(superview.bounds)
    }
    
    class func fromNib(_ name: String) -> UIView? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?[0] as? UIView
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let rectShape = CAShapeLayer()
        rectShape.bounds = frame
        rectShape.position = center
        rectShape.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        
        layer.mask = rectShape
    }
    
    func simpleShakeAnimation(duration: CFTimeInterval = 0.3, transition: CGFloat = 10, color: UIColor = UIColor.red) {
        CATransaction.begin()
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.values = [-transition, transition, -transition, transition, -(transition/2), (transition/2), -(transition/4), (transition/4), 0.0 ]
        
        layer.add(animation, forKey: "shake")
        
        CATransaction.commit()
    }
}
