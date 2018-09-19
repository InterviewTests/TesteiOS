//
//  TextField.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

enum TextFieldType {
    case text
    case telephone
    case email
}

class TextField: UITextField {
    var type: TextFieldType = .text
    var borderColor: CGColor?
    
    var validField: Bool = false {
        didSet {
            if validField {
                borderColor = UIColor.validFieldGreen.cgColor
            } else {
                borderColor = UIColor.invalidFieldRed.cgColor
            }
        }
    }
    
    override open var text: String? {
        didSet{
            handleCleanButton()
            validateFields()
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        NotificationCenter.default.addObserver(self, selector: #selector(handleCleanButton), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(validateFields), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(applyMask), name: NSNotification.Name.UITextFieldTextDidChange, object: self)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if let borderColor = borderColor {
            setupBorder(with: borderColor)
        }
    }
}

//MARK: Layout methods
extension TextField {
    fileprivate func setupBorder(with color: CGColor) {
        let border = CALayer()
        let width = CGFloat(1.0)
        
        border.borderColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    fileprivate func addCleanButton() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let cleanButton = UIButton()
        cleanButton.setImage(#imageLiteral(resourceName: "ic_clean"), for: .normal)
        cleanButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        cleanButton.addTarget(self, action: #selector(cleanText), for: .touchUpInside)
        view.addSubview(cleanButton)
        self.rightView = view
        self.rightViewMode = .always
    }
    
    fileprivate func removeCleanButton() {
        self.rightView = nil
    }
}

//MARK: Usability methods
extension TextField {
    @objc
    fileprivate func cleanText() {
        self.text = ""
    }
    
    @objc
    fileprivate func handleCleanButton() {
        if let text = text {
            if text.count > 0 {
                self.addCleanButton()
            } else {
                self.removeCleanButton()
            }
        }
    }
    
    @objc
    fileprivate func validateFields() {
        validField = false
        switch type {
        case .text:
            if let text = text {
                validField = !text.isEmpty
            }
        case .telephone:
            if let text = text {
                if text.count >= 13 {
                    validField = true
                }
            }
        case .email:
            if let text = text {
                validField = text.isValidEmail()
            }
        }
    }
    
    @objc
    fileprivate func applyMask() {
        if type == .telephone {
            self.text = self.text?.telephoneMask()
        }
    }
}
