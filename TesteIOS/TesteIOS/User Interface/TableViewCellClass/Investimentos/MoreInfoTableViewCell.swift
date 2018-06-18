//
//  MoreInfoTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblMonthFund: UILabel!
    @IBOutlet weak var lblYearFund: UILabel!
    @IBOutlet weak var lblLastYearFund: UILabel!
    @IBOutlet weak var lblMonthCDI: UILabel!
    @IBOutlet weak var lblYearCDI: UILabel!
    @IBOutlet weak var lblLastYearCDI: UILabel!
    
    func configureCell(fund: Funds) {
        self.lblMonthFund.text = "\(fund.moreInfo.month.fund)"
        self.lblYearFund.text = "\(fund.moreInfo.year.fund)"
        self.lblLastYearFund.text = "\(fund.moreInfo.lastYear.fund)"
        self.lblMonthCDI.text = "\(fund.moreInfo.month.CDI)"
        self.lblYearCDI.text = "\(fund.moreInfo.year.CDI)"
        self.lblLastYearCDI.text = "\(fund.moreInfo.lastYear.CDI)"
    }
}
