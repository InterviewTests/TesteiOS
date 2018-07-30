//
//  CheckboxTableViewCell.swift
//  iOSTest
//
//  Created by erick.peripolli on 30/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(description: String) {
        self.descriptionLabel.text = description
    }

    @IBAction func tappedCheckbox(_ sender: UIButton) {
        
    }
}
