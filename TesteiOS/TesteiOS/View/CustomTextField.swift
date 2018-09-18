//
//  CustomTextField.swift
//  TesteiOS
//
//  Created by Nicolau on 13/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    var typeField: TypeField = .text
    @IBInspectable var typeFieldRawValue: Int = 1 {
        didSet {
            typeField = TypeField(rawValue: typeFieldRawValue) ?? .text
            updateView()
        }
    }
    
    lazy var customPlaceholderLabel: CustomPlaceholderLabel = {
        let view = CustomPlaceholderLabel(frame: self.frame)
        view.changeStatus(to: .noFocus)
        
        return view
    }()
    
    lazy var statusView: StatusView = {
        let view = StatusView(frame: self.frame)
        view.changeStatus(to: .noFocus)
        
        return view
    }()
    
    override func awakeFromNib() {
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        updateView()
    }
    
    func updateView() {
        self.borderStyle = .none
        
        switch typeField {
        case .text:
            self.autocapitalizationType = .words
            break
        case .telNumber:
            self.keyboardType = .phonePad
            break
        case .email:
            self.keyboardType = .emailAddress
            self.autocapitalizationType = .none
            self.autocorrectionType = .no
            break
        }
        
        self.addSubview(customPlaceholderLabel)
        self.addSubview(statusView)
        self.bringSubview(toFront: statusView)
    }
}
