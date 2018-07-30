//
//  UICustomTexfield.swift
//  TesteiOS
//
//  Created by Tiago Leme on 29/07/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import UIKit

@IBDesignable class UICustomTexfield: UITextField {

    let borderLayer = CALayer()
    let placeholderLabel = UILabel()
    
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
    
    func setBorder(){
        
        self.borderLayer.frame = CGRect(origin: CGPoint(x: 0, y: frame.height - self.borderHeight), size: CGSize(width: frame.width, height: self.borderHeight))
        self.borderLayer.backgroundColor = self.borderColor.cgColor
    }
    
    func setPlaceholder(){
        
        self.placeholderLabel.frame = frame.insetBy(dx: 0, dy: 0)
        self.placeholderLabel.text = placeholder
        self.placeholderLabel.font = UIFont(name: font!.fontName, size: self.labelFontSize)
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
        
        placeholder = ""
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
