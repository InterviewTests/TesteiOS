//
//  InfoTitleTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class InfoTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblInfoTitle: UILabel!
    
    func configureCell(fund: Funds) {
        self.lblInfoTitle.text = fund.infoTitle
    }
}
