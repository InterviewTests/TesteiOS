//
//  UITextView.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

extension UITextView {
    func maximunSize() -> CGSize {
        let fixedWidth = frame.size.width
        return sizeThatFits(CGSize(width: fixedWidth,
                                   height: CGFloat.greatestFiniteMagnitude))
    }
}
