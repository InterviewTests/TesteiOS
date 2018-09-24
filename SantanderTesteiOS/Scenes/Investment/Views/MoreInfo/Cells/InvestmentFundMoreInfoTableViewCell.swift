//
//  InvestmentFundMoreInfoTableViewCell.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class InvestmentFundMoreInfoTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var fundLabel: UILabel!
    @IBOutlet private weak var CDILabel: UILabel!
    
    var fund  : Fund!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func set(fund : Fund) {
        self.fund  = fund
        self.setupInterface()
    }
    
    private func setupInterface() {
        self.titleLabel.text = fund.title
        self.fundLabel.text  = "\(fund.fund)%"
        self.CDILabel.text   = "\(fund.CDI)%"
    }
}
