//
//  CheckboxTableViewCell.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 03/06/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell {
    @IBOutlet weak var checkboxBtn: UIButton!
    @IBOutlet weak var checboxLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
