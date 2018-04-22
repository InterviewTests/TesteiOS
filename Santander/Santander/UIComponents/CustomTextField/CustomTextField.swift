//
//  CustomTextField.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class CustomTextField: UIView {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var statusBar: UIView!
    @IBOutlet weak var clearButton: UIButton!
    var fieldIsValid: Bool = false
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
        self.textField.delegate = self
        self.textField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        self.textField.returnKeyType = .done
        self.hideClearButton(true)
    }
    
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    @IBAction func clearClick(_ sender: Any) {
        
        if self.textField.isEditing {
            self.textField.text = ""
        } else {
            self.textField.text = ""
            self.animateLabel(state: false)
        }
        
        self.hideClearButton(true)
    }
    
    private func hideClearButton(_ hide: Bool) {
        self.clearButton.isHidden = hide
    }
    
    private func validadeField() {
        
    }
    
    private func animateLabel(state: Bool) {
        var frame = self.label.frame
        
        if state {
            frame.origin.y = 0
            UIView.animate(withDuration: 0.1) {
                self.label.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.label.frame = frame
            }
        } else {
            frame.origin.y = 30
            UIView.animate(withDuration: 0.1) {
                self.label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.label.frame = frame
            }
        }
    }
    
    
}

extension CustomTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.animateLabel(state: true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            self.animateLabel(state: false)
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        if textField.text == "" {
           self.hideClearButton(true)
        } else {
            self.hideClearButton(false)
        }
        
        self.validadeField()
    }
}


