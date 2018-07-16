//
//  SantanderInvestmentRiskIndicatorCellTableViewCell.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 15/07/2018.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderInvestmentRiskIndicatorCellTableViewCell: UITableViewCell {

    @IBOutlet weak var greenRisk1: UIImageView!
    
    @IBOutlet weak var yellowRisk: UIImageView!
    @IBOutlet weak var redRisk2: UIImageView!
    
    @IBOutlet weak var redRisk1: UIImageView!
    @IBOutlet weak var greenRisk2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
