//
//  whatIsTableViewCell.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 04/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class whatIsTableViewCell: UITableViewCell {
    @IBOutlet weak var whatIs: UILabel!
    @IBOutlet weak var definition: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(screenInfo: InvestimentScreen) {
        whatIs.text = screenInfo.whatIs
        definition.text = screenInfo.definition
    }
}
