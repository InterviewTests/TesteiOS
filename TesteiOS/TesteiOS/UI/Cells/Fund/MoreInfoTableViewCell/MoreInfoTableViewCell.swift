//
//  MoreInfoTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 24/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: FundBaseTableViewCell {
  @IBOutlet weak var infoTitleLabel: UILabel!
  @IBOutlet weak var monthFundLabel: UILabel!
  @IBOutlet weak var monthCdiLabel: UILabel!
  @IBOutlet weak var yearFundLabel: UILabel!
  @IBOutlet weak var yearCdiLabel: UILabel!
  @IBOutlet weak var twelveMonthsFundLabel: UILabel!
  @IBOutlet weak var twelveMonthsCdiLabel: UILabel!
  
  override func setup(with fund: Fund) {
    infoTitleLabel.text = fund.infoTitle
    monthFundLabel.text = String(format: "%.1f %%", fund.moreInfo.month.fund)
    monthCdiLabel.text = String(format: "%.1f %%", fund.moreInfo.month.cdi)
    yearFundLabel.text = String(format: "%.1f %%", fund.moreInfo.year.fund)
    yearCdiLabel.text = String(format: "%.1f %%", fund.moreInfo.year.cdi)
    twelveMonthsFundLabel.text = String(format: "%.1f %%", fund.moreInfo.twelveMonths.fund)
    twelveMonthsCdiLabel.text = String(format: "%.1f %%", fund.moreInfo.twelveMonths.cdi)
  }
}
