//
//  DefinitionTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {
    @IBOutlet weak var lblWhatIs: UILabel!
    @IBOutlet weak var lblDefinition: UILabel!
    
    func configureCell(fund: Funds) {
        self.lblWhatIs.text = fund.whatIs
        self.lblDefinition.text = fund.definition
    }
}
