//
//  ShowFundsViewController+layout.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

extension ShowFundsViewController {
    func buildDownInfo(viewModel: ViewModel) {
        
        if viewModel.infoNames.count + viewModel.downInfoNames.count == 0 {
            return
        }
        
        var closestTopView: UIView = bottomSeparator
        self.buttonTopConstraint.isActive = false
        
        let layoutClosure: ([String], [String]?) -> () = {leftItems, rightItems in
            leftItems
                .enumerated()
                .forEach { index, element in
                    let nameLabel = UILabel()
                    nameLabel.text = element
                    nameLabel.textColor = UIColor.CustomColor.lighterGray
                    nameLabel.font = UIFont(name: "DINPro-Regular", size: 15)
                    nameLabel.adjustsFontSizeToFitWidth = true
                    self.contentView.addSubview(nameLabel)
                    
                    nameLabel.translatesAutoresizingMaskIntoConstraints = false
                    nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
                    nameLabel.topAnchor.constraint(equalTo: closestTopView.bottomAnchor, constant: 20).isActive = true
                    nameLabel.trailingAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
                    closestTopView = nameLabel
                    
                    var rightItem: UIView?
                    
                    if rightItems != nil {
                        let valueLabel = UILabel()
                        valueLabel.text = viewModel.infoData[index]
                        valueLabel.textColor = UIColor.black
                        valueLabel.font = UIFont(name: "DINPro-Regular", size: 15)
                        valueLabel.adjustsFontSizeToFitWidth = true
                        valueLabel.textAlignment = .right
                        rightItem = valueLabel
                    } else {
                        let button = UIButton(type: .custom)
                        button.setTitle("Baixar", for: .normal)
                        button.setTitleColor(UIColor.CustomColor.vividRed, for: .normal)
                        button.backgroundColor = UIColor.clear
                        button.titleLabel?.textAlignment = .right
                        button.titleLabel?.font = UIFont(name: "DINPro-Regular", size: 15)
                        button.sizeToFit()
                        button.addTarget(self, action: #selector(self.openSafariPage), for: .touchUpInside)
                        rightItem = button
                    }
                    
                    self.contentView.addSubview(rightItem!)
                    rightItem?.translatesAutoresizingMaskIntoConstraints = false
                    rightItem?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30).isActive = true
                    rightItem?.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
                    rightItem?.leadingAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 20).isActive = false
            }
        }
        
        layoutClosure(viewModel.infoNames, viewModel.infoData)
        layoutClosure(viewModel.downInfoNames, nil)
        
        self.investButton.topAnchor.constraint(equalTo: closestTopView.bottomAnchor, constant: 45).isActive = true
        
        contentView.setNeedsUpdateConstraints()
        
    }
    
    
    func display(viewModel: ShowFunds.Funds.ViewModel) {
        
        // Ensure this code will be called in the main thread
        DispatchQueue.main.async {
            self.titleLabel.text = viewModel.title
            self.fundNameLabel.text = viewModel.fundName
            self.descriptionTitleLabel.text = viewModel.whatIs
            self.descriptionLabel.text = viewModel.definition
            self.riskTitleLabel.text = viewModel.riskTitle
            self.riskMeter.riskIndex = viewModel.risk - 1
            self.extraInfoTitleLabel.text = viewModel.infoTitle
            
            for (index, element) in self.fundLabels.enumerated() {
                element.text = viewModel.moreInfoFunds[index]
            }
            
            for (index, element) in self.CDILabels.enumerated() {
                element.text = viewModel.moreInfoCDI[index]
            }
            
            self.buildDownInfo(viewModel: viewModel)
        }
    }
}
