//
//  TVC_Downinfo_TableViewCell.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 06/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class TVC_Downinfo_TableViewCell: UITableViewCell {

    @IBOutlet weak var Name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func Tap_Download(_ sender: UIButton) {
    }
}
