//
//  LabelTableViewCell.swift
//  iOSTest
//
//  Created by erick.peripolli on 30/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(text: String) {
        self.messageLabel.text = text
    }

}
