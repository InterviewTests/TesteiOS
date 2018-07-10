//
//  CheckboxTableViewCell.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell {
    @IBOutlet weak var outerBox: UIView!
    @IBOutlet weak var innerBox: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        outerBox.layer.borderColor = UIColor.darkGray.cgColor
        outerBox.layer.borderWidth = 3.0
    }
}
