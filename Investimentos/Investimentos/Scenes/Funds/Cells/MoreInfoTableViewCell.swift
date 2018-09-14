//
//  MoreInfoTableViewCell.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 13/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {

    @IBOutlet var cdiLabel: UILabel!
    @IBOutlet var fundLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
