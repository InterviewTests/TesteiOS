//
//  SantanderButton.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SantaderButton: UIButton, ConfigurableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String) {
        self.init()
        self.setTitle(title, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 22
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.backgroundColor = #colorLiteral(red: 0.8666666667, green: 0, blue: 0, alpha: 1)
        self.titleLabel?.font = UIFont(name: "Futura", size: 20)
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
}
