//
//  MoreInfoTableViewCell.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 14/07/2018.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var statsFund: UILabel!
    @IBOutlet weak var statsCDI: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
