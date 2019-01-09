//
//  HeaderCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class HeaderCell: BaseCell {
    
    /// The title of the page
    private let title:UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// The name of the fund
    private let fundName:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// The top divider
    private let divider:UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor.init(hexString: "#20C0C0C0")
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    /// Label "O que é"
    private let whatIs:UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// The description of he fund
    private let definition:UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// Label "Grau de investimento"
    private let riskTitle:UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// INdicates the risk of the investment
    private let indicator:UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrow")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// The colours that a risk can have
    private let colours = ["#70DC5A", "#44C268", "#FFC100", "#FF7418", "#FF332A"]
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 1.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        /// Adds the beer's colours to the stackview
        for colour in colours{
            let view = UIView()
            view.backgroundColor = UIColor.init(hexString: colour)
            view.heightAnchor.constraint(equalToConstant: 5).isActive = true
            stackView.addArrangedSubview(view)
        }
        return stackView
    }()
    
    /// Label "Mais informações"
    private let infoTitle:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// Label FUNDO
    private let staticLabelFund:UILabel = {
        let label = UILabel()
        label.text = "Fundo"
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// Label CDI
    private let staticLabelCDI:UILabel = {
        let label = UILabel()
        label.text = "CDI"
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.textAlignment = .right
        label.font =  UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(title)
        self.contentView.addSubview(fundName)
        self.contentView.addSubview(divider)
        self.contentView.addSubview(whatIs)
        self.contentView.addSubview(definition)
        self.contentView.addSubview(riskTitle)
        self.contentView.addSubview(indicator)
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(infoTitle)
        self.contentView.addSubview(staticLabelCDI)
        self.contentView.addSubview(staticLabelFund)
        
        NSLayoutConstraint.activate([
            title.widthAnchor  .constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/1.3),
            title.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            title.topAnchor    .constraint(equalTo: self.contentView.topAnchor, constant:30),
            
            fundName.leadingAnchor  .constraint(equalTo: title.leadingAnchor),
            fundName.trailingAnchor .constraint(equalTo: title.trailingAnchor),
            fundName.topAnchor      .constraint(equalTo: title.bottomAnchor, constant:10),
            
            divider.heightAnchor   .constraint(equalToConstant: 1),
            divider.leadingAnchor  .constraint(equalTo: fundName.leadingAnchor),
            divider.trailingAnchor .constraint(equalTo: fundName.trailingAnchor),
            divider.topAnchor      .constraint(equalTo: fundName.bottomAnchor, constant:15),
            
            whatIs.leadingAnchor  .constraint(equalTo: divider.leadingAnchor),
            whatIs.trailingAnchor .constraint(equalTo: divider.trailingAnchor),
            whatIs.topAnchor      .constraint(equalTo: divider.bottomAnchor, constant:15),
            
            definition.leadingAnchor  .constraint(equalTo: whatIs.leadingAnchor),
            definition.trailingAnchor .constraint(equalTo: whatIs.trailingAnchor),
            definition.topAnchor      .constraint(equalTo: whatIs.bottomAnchor, constant:5),
            
            riskTitle.leadingAnchor  .constraint(equalTo: definition.leadingAnchor),
            riskTitle.trailingAnchor .constraint(equalTo: definition.trailingAnchor),
            riskTitle.topAnchor      .constraint(equalTo: definition.bottomAnchor, constant:30),
            
            indicator.widthAnchor.constraint(equalToConstant:  15),
            indicator.heightAnchor.constraint(equalToConstant: 15),
            indicator.bottomAnchor.constraint(equalTo:  stackView.topAnchor),
           
            stackView.topAnchor  .constraint(equalTo:  riskTitle.bottomAnchor, constant:20),
            stackView.leadingAnchor  .constraint(equalTo: riskTitle.leadingAnchor),
            stackView.trailingAnchor .constraint(equalTo: riskTitle.trailingAnchor),
            
            infoTitle.leadingAnchor  .constraint(equalTo: stackView.leadingAnchor),
            infoTitle.trailingAnchor .constraint(equalTo: stackView.trailingAnchor),
            infoTitle.topAnchor      .constraint(equalTo: stackView.bottomAnchor, constant:30),
            
            staticLabelCDI.widthAnchor    .constraint(equalToConstant: 70),
            staticLabelCDI.trailingAnchor .constraint(equalTo: self.contentView.trailingAnchor, constant:-15),
            staticLabelCDI.topAnchor      .constraint(equalTo: infoTitle.bottomAnchor, constant:20),
            staticLabelCDI.bottomAnchor   .constraint(equalTo: self.contentView.bottomAnchor, constant:-10),
            
            staticLabelFund.widthAnchor   .constraint(equalTo: staticLabelCDI.widthAnchor),
            staticLabelFund.trailingAnchor.constraint(equalTo: staticLabelCDI.leadingAnchor),
            staticLabelFund.centerYAnchor .constraint(equalTo: staticLabelCDI.centerYAnchor),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets the information of the header
    func setupHeader(for screen:Screen?){
        title.text      = screen?.title
        fundName.text   = screen?.fundName
        whatIs.text     = screen?.whatIs
        definition.text = screen?.definition
        riskTitle.text  = screen?.riskTitle
        infoTitle.text  = screen?.infoTitle
        
        /// Calculates where the risk indicator should be placed according to the risk level (1 to 5)
        if let risk = screen?.risk{
            let stackViewWidth     = (UIScreen.main.bounds.width/(1.3))
            let stackViewItemWidth = stackViewWidth/5
            
            let x = (stackViewItemWidth * CGFloat(risk)) - (stackViewItemWidth/2)
            NSLayoutConstraint.activate([
                indicator.centerXAnchor.constraint(equalTo: stackView.leadingAnchor, constant: x)
            ])
        }
    }
}
