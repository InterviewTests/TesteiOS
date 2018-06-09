//
//  ButtonCell.swift
//  TesteiOS
//
//  Created by Macbook on 09/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import UIKit
import LGButton

protocol ButtonCellDelegate : class {
    func btnSendTapped(_ tag: Int)
}

class ButtonCell: UITableViewCell {

    @IBOutlet weak var btnSend: LGButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    weak var btnCellDelegate : ButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnSendTapped(_ sender: LGButton) {
        btnCellDelegate?.btnSendTapped(sender.tag)
    }
}
