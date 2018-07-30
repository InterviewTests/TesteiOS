//
//  UITextFieldExtension.swift
//  iOSTest
//
//  Created by erick.peripolli on 30/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder() {
        let view = UIView(frame: CGRect(x: 0.0, y: 30, width: UIScreen.main.bounds.width * 0.92, height: 1))
        view.backgroundColor = .black
        self.addSubview(view)
    }
}
