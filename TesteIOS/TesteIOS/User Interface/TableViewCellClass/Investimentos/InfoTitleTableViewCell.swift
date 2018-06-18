//
//  MoreInfoTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class InfoTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblInfoTitle: UILabel!
    
    func configureCell(fund: Funds) {
        self.lblInfoTitle.text = fund.infoTitle
    }
}
