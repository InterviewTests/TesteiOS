//
//  CustomRiskView.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CustomRiskView: UIView, ConfigurableView {
    
    lazy var firstRisk = UIView(viewColor: .init(red: 0, green: 10, blue: 0, alpha: 0.3))
    lazy var secondRisk = UIView(viewColor: .green)
    lazy var thridRisk = UIView(viewColor: .yellow)
    lazy var fourthRisk = UIView(viewColor: .orange)
    lazy var fithRisk = UIView(viewColor: .red)
    
    lazy var selector: UIImageView = {
        let image = UIImageView(image: UIImage(named: "selector"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        addSubviews([firstRisk, secondRisk,thridRisk,fourthRisk,fithRisk])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            firstRisk.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstRisk.topAnchor.constraint(equalTo: self.topAnchor),
            firstRisk.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            firstRisk.trailingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            
            secondRisk.leadingAnchor.constraint(equalTo: firstRisk.trailingAnchor, constant: 0),
            secondRisk.topAnchor.constraint(equalTo: topAnchor),
            secondRisk.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondRisk.trailingAnchor.constraint(equalTo: firstRisk.trailingAnchor, constant: 70),
            
            thridRisk.leadingAnchor.constraint(equalTo: secondRisk.trailingAnchor, constant: 0),
            thridRisk.topAnchor.constraint(equalTo: topAnchor),
            thridRisk.bottomAnchor.constraint(equalTo: bottomAnchor),
            thridRisk.trailingAnchor.constraint(equalTo: secondRisk.trailingAnchor, constant: 70),
            
            fourthRisk.leadingAnchor.constraint(equalTo: thridRisk.trailingAnchor, constant: 0),
            fourthRisk.topAnchor.constraint(equalTo: topAnchor),
            fourthRisk.bottomAnchor.constraint(equalTo: bottomAnchor),
            fourthRisk.trailingAnchor.constraint(equalTo: thridRisk.trailingAnchor, constant: 70),
            
            fithRisk.leadingAnchor.constraint(equalTo: fourthRisk.trailingAnchor, constant: 0),
            fithRisk.topAnchor.constraint(equalTo: topAnchor),
            fithRisk.bottomAnchor.constraint(equalTo: bottomAnchor),
            fithRisk.trailingAnchor.constraint(equalTo: fourthRisk.trailingAnchor, constant: 70)
            ])
    }
}
