//
//  UIViewExtensions.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 20/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
