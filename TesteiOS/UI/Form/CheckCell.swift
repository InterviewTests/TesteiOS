//
//  CheckCell.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 09/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit
import M13Checkbox

class CheckCell: UITableViewCell {

    @IBOutlet weak var chkBox: M13Checkbox!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
