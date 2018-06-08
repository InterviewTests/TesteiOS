//
//  InvestDownInfoTableViewCell.swift
//  InvestApp
//
//  Created by Victor Tavares on 08/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import UIKit

class InvestDownInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var downloadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
