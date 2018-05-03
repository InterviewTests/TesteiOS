//
//  PhoneTextField.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 03/05/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class PhoneTextField: UIView {
    
    var textField: JMMaskTextField?
    
    enum State { case normal, selected, available, error }
    
    var validationState: State  = .selected
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
        setupBottomBorder()
        setupClearButton()
        setState(.normal)
        self.textField = JMMaskTextField(frame: self.bounds)
        self.textField?.maskString = "(00) 00000-0000"
        
        guard let textField = self.textField else { return }
        self.addSubview(textField)
        textField.delegate = self
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
        self.textField?.rightViewMode = .always
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setImage(UIImage(named: "clear-button"), for: .normal)
        button.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
        self.textField?.rightView = button
    }
    
    func setState(_ state: State) {
        self.textField?.rightView?.isHidden = (state == .normal) ? true : false
        
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
        self.textField?.text = ""
    }
    
}

extension PhoneTextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setState(.selected)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setState(.normal)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textString = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string) as String
        
        setState(.selected)
        
        guard let unmaskedText = self.textField?.stringMask?.unmask(string: textString) else { return true }
        
        if unmaskedText.count == 0 {
            setState(.selected)
        } else if unmaskedText.count > 0 && unmaskedText.count < 10 {
            setState(.error)
            validationState = .error
        } else {
            setState(.available)
            validationState = .available
        }
        
        if unmaskedText.count > 10 {
            self.textField?.maskString = "(00) 00000-0000"
        } else {
            self.textField?.maskString = "(00) 0000-0000"
        }
        
        return true
    }
}
