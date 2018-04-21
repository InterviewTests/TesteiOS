//
//  TextField.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

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
        switch type {
        case .text:
            if let text = text {
                validField = !text.isEmpty
            } else {
                validField = false
            }
        case .telephone:
            
        break
            
        case .email:
            break
        }
    }
    
    @objc
    fileprivate func applyMask() {
        if type == .telephone {
            let regexMap = [
                "(\\d{0})",
                "(\\d{1})",
                "(\\d{2})",
                "((\\d{2}))",
                "((\\d{2})) "
            ]
            
            if let regexIndex = text?.count {
                let regexUsed = regexMap[regexIndex]
                text = NSStringMask.maskString(text, withRegex: regexUsed)
            }
            
        }
    }
}
