//
//  MoreInfoTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
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
        self.lblMonthFund.text = "\(fund.moreInfo.month.fund) %".replacingOccurrences(of: ".", with: ",")
        self.lblYearFund.text = "\(fund.moreInfo.year.fund) %".replacingOccurrences(of: ".", with: ",")
        self.lblLastYearFund.text = "\(fund.moreInfo.lastYear.fund) %".replacingOccurrences(of: ".", with: ",")
        self.lblMonthCDI.text = "\(fund.moreInfo.month.CDI) %".replacingOccurrences(of: ".", with: ",")
        self.lblYearCDI.text = "\(fund.moreInfo.year.CDI) %".replacingOccurrences(of: ".", with: ",")
        self.lblLastYearCDI.text = "\(fund.moreInfo.lastYear.CDI) %".replacingOccurrences(of: ".", with: ",")
    }
}
