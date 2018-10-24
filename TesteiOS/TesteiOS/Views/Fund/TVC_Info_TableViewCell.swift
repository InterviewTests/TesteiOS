//
//  TVC_Info_TableViewCell.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class TVC_Info_TableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Data: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
