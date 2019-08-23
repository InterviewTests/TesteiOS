//
//  UIStackView.swift
//  Santander
//
//  Created by Orlando Amorim on 10/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit.UIStackView

extension UIStackView {
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach({
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
    }
}
