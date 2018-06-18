//
//  RiskTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
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
        let index = fund.risk - 1
        let riskBottomConstraint = self.riskBottomConstraints[index]
        let riskTopConstraint = self.riskTopConstraints[index]
        
        self.imgRiskIndicator[index].isHidden = false
        riskTopConstraint.constant = 4
        riskBottomConstraint.constant = 0
    }
}
