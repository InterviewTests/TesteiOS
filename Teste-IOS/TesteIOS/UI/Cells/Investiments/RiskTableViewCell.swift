//
//  RiskTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class RiskTableViewCell: UITableViewCell {
    @IBOutlet var imgRiskIndicator: [UIImageView]!
    @IBOutlet var riskTopConstraints: [NSLayoutConstraint]!
    @IBOutlet var riskBottomConstraints: [NSLayoutConstraint]!
    
    func setAllRiskINdicatorHidden() {
        for indicator in imgRiskIndicator {
            indicator.isHidden = true
        }
    }
    
    func configureCell(fund: Funds) {
        self.setAllRiskINdicatorHidden()
        var index = fund.risk - 1
        
        if index < 0 || index > self.riskTopConstraints.count {
            index = 0
        }
        
        let riskBottomConstraint = self.riskBottomConstraints[index]
        let riskTopConstraint = self.riskTopConstraints[index]
        
        self.imgRiskIndicator[index].isHidden = false
        riskTopConstraint.constant = 4
        riskBottomConstraint.constant = 0
    }
}
