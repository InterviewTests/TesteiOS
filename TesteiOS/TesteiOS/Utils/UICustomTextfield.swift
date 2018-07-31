//
//  UICustomTexfield.swift
//  TesteiOS
//
//  Created by Tiago Leme on 29/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit
import AnyFormatKit

@IBDesignable class UICustomTextfield: UITextField {

    let borderLayer = CALayer()
    let placeholderLabel = UILabel()
    let clearButton = UIButton()
    
    var masks: [String]? {
        didSet{
            masks!.sort(by: { (value1: String, value2: String) -> Bool in
                return value1.count > value2.count
            })
        }
    }
    
    var isValid: Bool = false {
        didSet{
            if self.isValid {
                self.borderLayer.backgroundColor = UIColor(red: 101/255.0, green: 190/255.0, blue: 48/255.0, alpha: 1.0).cgColor //Green Color
            } else {
                self.borderLayer.backgroundColor = UIColor(red: 255/255.0, green: 31/255.0, blue: 31/255.0, alpha: 1.0).cgColor //Red Color
            }
        }
    }
    
    var validationRegEx = ".{0,}"

    private func validate(string: String) {
        
        let stringTest = NSPredicate(format:"SELF MATCHES %@", validationRegEx)
        self.isValid = stringTest.evaluate(with: string)
    }
    

    
    @IBInspectable var borderHeight: CGFloat = 1.0 {
        didSet{
            self.setBorder()
        }
    }
    
    @IBInspectable var borderColor: UIColor = .lightGray {
        didSet{
            self.setBorder()
        }
    }
    
    @IBInspectable var labelFontSize: CGFloat = 11.0 {
        didSet{
            self.placeholderLabel.font = UIFont(name: font!.fontName, size: self.labelFontSize)
            self.placeholderLabel.sizeToFit()
        }
    }
    
    @IBInspectable var labelColor: UIColor = .lightGray {
        didSet{
            self.setPlaceholder()
        }
    }
    
    @IBInspectable var textBottomInset: CGFloat = 0
    
    @IBInspectable var labelText: String = "Label" {
        didSet{
            self.placeholderLabel.text = self.labelText
            self.placeholderLabel.sizeToFit()
        }
    }

    func setBorder(){
        
        self.borderLayer.frame = CGRect(origin: CGPoint(x: 0, y: frame.height - self.borderHeight), size: CGSize(width: frame.width, height: self.borderHeight))
        self.borderLayer.backgroundColor = self.borderColor.cgColor
    }
    
    func setPlaceholder(){
        
        self.placeholderLabel.frame = super.frame.insetBy(dx: 0, dy: 0)
        self.placeholderLabel.text = self.labelText
        self.placeholderLabel.font = UIFont(name: super.font!.fontName, size: self.labelFontSize)
        self.placeholderLabel.textColor = self.labelColor
        self.placeholderLabel.sizeToFit()
        
        self.placeholderLabel.frame = CGRect(x: 0, y: 0, width: self.placeholderLabel.bounds.width, height: self.placeholderLabel.bounds.height)        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
    
        self.setBorder()
        self.setPlaceholder()
        
        self.setClearButton()
        
        self.addTarget(self, action: #selector(textDidChange), for: UIControlEvents.editingChanged)
    }
    
    private func applyMask(){
        guard let masks = self.masks else {
            return
        }

        if masks.count == 1 {
            text = self.format(string: text!, maskPattern: masks[0])
        } else {
            let mask = super.text!.count >= masks[0].count ? masks[0] : masks[1]
            text = self.format(string: text!, maskPattern: mask)
        }
    }
    
    private func format(string: String, maskPattern: String) -> String? {
        
        let charactersToReplace = maskPattern.replacingOccurrences(of: "[#]", with: "", options: .regularExpression)

        let formatter = TextFormatter(textPattern: maskPattern)
        return formatter.formattedText(from: string.replacingOccurrences( of:"[\(charactersToReplace)]", with: "", options: .regularExpression))
    }
    
    @objc func textDidChange() {
        self.toggleClearButton()
        self.applyMask()
        self.validate(string: super.text!)
    }
    
    @objc func toggleClearButton(){
        if super.text != nil && super.text!.count > 0 {
            self.rightView?.alpha = 1
        } else {
            self.rightView?.alpha = 0
        }
    }
    
    func setClearButton(){
        let clearButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        clearButton.setImage(#imageLiteral(resourceName: "Limpar"), for: .normal)
        
        self.rightView = clearButton
        clearButton.addTarget(self,action: #selector(clearClicked), for: UIControlEvents.touchUpInside)
        
        self.clearButtonMode = UITextFieldViewMode.never
        self.rightViewMode = UITextFieldViewMode.always
        self.rightView?.alpha = 0
    }
    
    @objc func clearClicked()
    {
        super.text = ""
        self.textDidChange()
    }
    
    func drawElements(){
        layer.addSublayer(borderLayer)
        layer.masksToBounds = true
        
        addSubview(placeholderLabel)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 0, self.textBottomInset, 0))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 0,self.textBottomInset, 0))
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //super.draw(rect)
        
        self.drawElements()
  
    }
    

}
