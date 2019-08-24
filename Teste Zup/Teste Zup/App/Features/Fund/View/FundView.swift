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
            infoTitle.text = fundViewModel?.fund?.screen.infoTitle
        }
    }
    
    let titleLabel = UILabel(textColor: .lightGray,font: nil)
    
    let fundName: UILabel = {
        let label = UILabel(textColor: .black, font: UIFont.init(name: "Arial", size: 32))
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    let separatorLine = UIView(style: .separatorStyle)
    let whatIs = UILabel(textColor: .lightGray, font: nil)
    
    let fundDefinition:  UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    let riskTitle = UILabel(textColor: .lightGray, font: nil)
    let customRiskView = CustomRiskView()
    let infoTitle = UILabel(textColor: .lightGray, font: nil)
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    
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
        addSubviews([titleLabel,fundName, separatorLine, whatIs, fundDefinition, riskTitle, customRiskView, infoTitle, tableView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 8),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            fundName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            fundName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            fundName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            separatorLine.topAnchor.constraint(equalTo: fundName.bottomAnchor, constant: 10),
            separatorLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            separatorLine.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            separatorLine.heightAnchor.constraint(equalToConstant: 5),
            
            
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
            
            customRiskView.heightAnchor.constraint(equalToConstant: 10),
            
            infoTitle.topAnchor.constraint(equalTo: customRiskView.bottomAnchor, constant: 30),
            infoTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            tableView.topAnchor.constraint(equalTo: infoTitle.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        
    }
}
