//
//  DefinitionTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
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
