//
//  InvestmentInfoCell.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class InvestmentInfoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var dataLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }
    
    func loadUI(_ fundInfo: FundInfo) {
        nameLabel?.text = fundInfo.name
        dataLabel?.text = fundInfo.data
    }
}
