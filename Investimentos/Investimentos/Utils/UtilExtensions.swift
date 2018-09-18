//
//  UtilExtensions.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 13/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

extension Double {
    //método utilizado para transformar um Double em String com simbolo de porcentagem
    func getPercentageStringValue() -> String {
        return String(format: "%.1f%%", self)
    }
}


extension UIView {
    
    //método utilizado para arredondar bordas de determinada view
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
