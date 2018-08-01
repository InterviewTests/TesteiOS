//
//  HeaderTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFundName: UILabel!
    
    func configureCell(fund: Funds) {
        self.lblTitle.text = fund.title
        self.lblFundName.text = fund.fundName
    }
}
