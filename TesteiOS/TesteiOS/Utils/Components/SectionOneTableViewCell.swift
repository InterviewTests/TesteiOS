//
//  SectionOneTableViewCell.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

class SectionOneTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldOne: UILabel!
    @IBOutlet weak var fieldTwo: UILabel!
    @IBOutlet weak var fieldThree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
