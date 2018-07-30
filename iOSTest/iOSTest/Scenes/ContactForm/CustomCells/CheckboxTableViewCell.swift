//
//  CheckboxTableViewCell.swift
//  iOSTest
//
//  Created by erick.peripolli on 30/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import UIKit

protocol CheckboxDelegate {
    func checkBoxTapped(isChecked: Bool, cellID: Int)
}

class CheckboxTableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    var delegate: CheckboxDelegate?
    var cellIDToShow: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(description: String, delegate: CheckboxDelegate, showId: Int) {
        self.descriptionLabel.text = description
        self.delegate = delegate
        self.cellIDToShow = showId
    }

    @IBAction func tappedCheckbox(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        } else {
            sender.isSelected = true
            
        }
        delegate?.checkBoxTapped(isChecked: sender.isSelected, cellID: self.cellIDToShow)
    }
}
