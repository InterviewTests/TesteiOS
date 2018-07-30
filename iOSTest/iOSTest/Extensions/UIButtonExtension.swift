//
//  UIButtonExtension.swift
//  iOSTest
//
//  Created by erick.peripolli on 30/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import UIKit

extension UIButton {
    func animate() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.alpha = 0.75
        }) { (_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = CGAffineTransform.identity
                self.alpha = 1.0
            })
        }
    }
}
