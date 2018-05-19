//
//  BaseContactFormView.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 14/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class BaseContactFormView: UIView {
    
    var cell: ContactFormItem?
    
    var heightConstraint: NSLayoutConstraint?
    
    var height: CGFloat {
        switch cell?.type {
        case .field?:
            return 60
        case .text?:
            return 60
        case .image?:
            return 0
        case .checkbox?:
            return 45
        case .send?:
            return 60
        default:
            return 0
        }
    }
    
    func error() {
        simpleShakeAnimation()
    }

    var onActive: ((Int?, Bool) -> Void)?
    
    override var isHidden: Bool {
        didSet {
            cell?.hidden = isHidden
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
