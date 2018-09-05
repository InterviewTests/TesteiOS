//
//  InvestInfoCellTableViewCell.swift
//  TesteiOS
//
//  Created by Andre Paganin on 04/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
//

import UIKit

class InvestInfoCellTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var infoValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

