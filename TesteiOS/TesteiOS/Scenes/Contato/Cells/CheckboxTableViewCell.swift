//
//  CheckboxTableViewCell.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/7/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

class CheckboxTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkbox: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(cell: Cell) {
        self.label.text = cell.message
    }
}
