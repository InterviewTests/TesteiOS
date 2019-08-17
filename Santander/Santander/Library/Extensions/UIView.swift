//
//  UIView.swift
//  Santander
//
//  Created by Orlando Amorim on 14/08/19.
//

import UIKit

extension UIView {
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    @available(iOS 11.0, *)
    func round(corners: CACornerMask, radius: CGFloat) {
        layer.maskedCorners = corners
        layer.cornerRadius = radius
    }
}
