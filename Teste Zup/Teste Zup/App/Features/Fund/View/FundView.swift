//
//  FundView.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FundView: UIView, ConfigurableView {

    var fundViewModel: FundViewModel? {
        didSet {
            titleLabel.text = fundViewModel?.fund?.screen.title
            fundName.text = fundViewModel?.fund?.screen.fundName
            fundDefinition.text = fundViewModel?.fund?.screen.definition
            whatIs.text = fundViewModel?.fund?.screen.whatIs
            riskTitle.text = fundViewModel?.fund?.screen.riskTitle
        }
    }
    
    let titleLabel = UILabel(textColor: .black)
    let fundName = UILabel(textColor: .black)
    let separatorLine = UIView(style: .separatorStyle)
    let whatIs = UILabel(textColor: .black)
    
    let fundDefinition:  UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    let riskTitle = UILabel(textColor: .black)
    let customRiskView = CustomRiskView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([titleLabel,fundName, separatorLine, whatIs, fundDefinition, riskTitle, customRiskView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 8),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fundName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            fundName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            separatorLine.topAnchor.constraint(equalTo: fundName.bottomAnchor, constant: 10),
            separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
            
            
            whatIs.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: 10),
            whatIs.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            fundDefinition.topAnchor.constraint(equalTo: whatIs.bottomAnchor, constant: 10),
            fundDefinition.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            fundDefinition.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
    
            riskTitle.topAnchor.constraint(equalTo: fundDefinition.bottomAnchor, constant: 30),
            riskTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            customRiskView.topAnchor.constraint(equalTo: riskTitle.bottomAnchor, constant: 10),
            customRiskView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            customRiskView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            customRiskView.heightAnchor.constraint(equalToConstant: 10)
            ])
    }
}
