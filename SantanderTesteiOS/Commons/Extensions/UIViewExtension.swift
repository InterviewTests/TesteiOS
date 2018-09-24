//
//  UIViewExtension.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

extension UIView {
    
    func xib() {
        let bundle  = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let view = UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: self, options: nil).first as! UIView
        switch bounds {
        case .zero:
            frame = view.bounds
        default:
            view.frame = bounds
        }
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        view.layoutIfNeeded()
    }
}
