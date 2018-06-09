//
//  ButtonCell.swift
//  TesteiOS
//
//  Created by Macbook on 09/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import UIKit
import LGButton

class ButtonCell: UITableViewCell {

    @IBOutlet weak var btnSend: LGButton!
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
