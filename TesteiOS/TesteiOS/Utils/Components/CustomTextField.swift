//
//  CustomTextField.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    enum InputType { case `default`, email, mobileNumber }
    enum State { case normal, selected, available, error }
    
    var inputType: InputType = .default
    private var bottomBorder = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    func commonInit() {
        self.delegate = self
        self.borderStyle = .none
        setupBottomBorder()
        setupClearButton()
        setState(.normal)
    }
    
    func setupBottomBorder() {
        bottomBorder = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        bottomBorder.backgroundColor = UIColor.lightGray
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bottomBorder)
        
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bottomBorder.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupClearButton() {
        self.rightViewMode = .always
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "clear-button"), for: .normal)
        button.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
        self.rightView = button
    }
    
    func setState(_ state: State) {
        self.rightView?.isHidden = (state == .normal) ? true : false

        switch state {
        case .normal:
            self.bottomBorder.backgroundColor = UIColor.lightGray
        case .selected:
            self.bottomBorder.backgroundColor = UIColor.selectedGray
        case .error:
            self.bottomBorder.backgroundColor = UIColor.redError
        case .available:
            self.bottomBorder.backgroundColor = UIColor.greenAvailable
        }
    }
    
    @objc func clearPressed() {
        setState(.selected)
        self.text = ""
    }
}

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setState(.selected)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setState(.normal)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textString = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string) as String
        
        setState(.selected)
        
        guard !textString.isEmpty else {
            return true
        }
        
        switch inputType {
        case .default:
            if textString.isEmpty {
               setState(.selected)
            } else {
                setState(.available)
            }
        case .email:
            if !textString.isEmailFormat() {
                setState(.error)
            } else {
                setState(.available)
            }
        default:
            break
        }
        
        return true
    }
}
