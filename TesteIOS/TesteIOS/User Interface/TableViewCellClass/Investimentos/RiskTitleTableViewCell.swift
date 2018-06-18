//
//  RiskTitleTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class RiskTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRiskTitle: UILabel!
    
    func configureCell(fund: Funds) {
        self.lblRiskTitle.text = fund.riskTitle
    }
}
