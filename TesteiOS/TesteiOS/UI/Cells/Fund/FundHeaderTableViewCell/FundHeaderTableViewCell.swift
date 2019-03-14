//
//  FundHeaderTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class FundHeaderTableViewCell: FundBaseTableViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var fundNameLabel: UILabel!
  @IBOutlet weak var whatIsLabel: UILabel!
  @IBOutlet weak var definitionLabel: UILabel!
  @IBOutlet weak var riskTitleLabel: UILabel!
  @IBOutlet weak var riskView: RiskView!
  
  override func setup(with fund: Fund) {
    titleLabel.text = fund.title
    fundNameLabel.text = fund.fundName
    whatIsLabel.text = fund.whatIs
    definitionLabel.text = fund.definition
    riskTitleLabel.text = fund.riskTitle
    riskView.setRist(risk: fund.risk)
  }

}
