//
//  Extensions.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 02/06/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func animateButton() {
        UIView.animate(
            withDuration: 0.2,
            animations: {
                self.backgroundColor = UIColor(red:0.92, green:0.46, blue:0.46, alpha:1.0)
                self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
    
            },
            completion: { (finish: Bool)
                in UIView.animate(
                    withDuration: 0.2,
                    animations: {
                        self.transform = CGAffineTransform.identity
                        self.backgroundColor = UIColor(red:0.85, green:0.00, blue:0.00, alpha:1.0)
                    }
                )
            }
        )
    }
}

