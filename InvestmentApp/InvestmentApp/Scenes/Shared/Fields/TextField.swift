//
//  TextField.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class TextField: UITextField {
    let border = CALayer()

    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        setupBorder()
    }
}

//MARK: Layout methods
extension TextField {
    func setupBorder() {
        let width = CGFloat(1.0)
        border.borderColor = UIColor.textFieldBorderLightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addCleanButton() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let cleanButton = UIButton()
        cleanButton.setImage(#imageLiteral(resourceName: "ic_clean"), for: .normal)
        cleanButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        cleanButton.addTarget(self, action: #selector(cleanText), for: .touchUpInside)
        view.addSubview(cleanButton)
        self.rightView = view
        self.rightViewMode = .always
    }
    
    func changeBorderColor(to color: CGColor) {
        border.borderColor = color
    }
}

//MARK: Usability methods
extension TextField {
    @objc
    func cleanText() {
        self.text = ""
    }
}
