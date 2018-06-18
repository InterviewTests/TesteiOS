//
//  HeaderTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
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
