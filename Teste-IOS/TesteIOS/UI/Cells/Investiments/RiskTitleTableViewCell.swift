//
//  RiskTitleTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class RiskTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRiskTitle: UILabel!
    
    func configureCell(fund: Funds) {
        self.lblRiskTitle.text = fund.riskTitle
    }
}
