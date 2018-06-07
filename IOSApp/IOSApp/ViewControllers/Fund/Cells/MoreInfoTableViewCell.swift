//
//  MoreInfoTableViewCell.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 01/06/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var MoreInfoLbl: UILabel!
    @IBOutlet weak var MIFundLbl: UILabel!
    @IBOutlet weak var MIcdiLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
