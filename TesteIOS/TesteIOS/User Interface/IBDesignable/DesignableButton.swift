//
//  DesignableButton.swift
//  TesteIOS
//
//  Created by Sidney Silva on 03/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
