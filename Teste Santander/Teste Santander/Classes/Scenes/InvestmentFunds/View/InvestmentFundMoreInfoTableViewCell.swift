//
//  InvestmentFundInfoTableViewCell.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

class InvestmentFundMoreInfoTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var monthFund: UILabel!
    @IBOutlet weak var monthCDI: UILabel!
    @IBOutlet weak var yearFund: UILabel!
    @IBOutlet weak var yearCDI: UILabel!
    @IBOutlet weak var twelveFund: UILabel!
    @IBOutlet weak var twelveCDI: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super .awakeFromNib()
    }
    
    // MARK: - Public Methods
    func setup(moreInfo: MoreInfo) {
        monthFund.text = "\(moreInfo.month.fund)%"
        monthCDI.text = "\(moreInfo.month.cdi)%"
        yearFund.text = "\(moreInfo.year.fund)%"
        yearCDI.text = "\(moreInfo.year.cdi)%"
        twelveFund.text = "\(moreInfo.the12Months.fund)%"
        twelveCDI.text = "\(moreInfo.the12Months.cdi)%"
    }
}
