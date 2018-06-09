//
//  CheckCell.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 09/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit
import M13Checkbox

protocol CheckCellDelegate : class {
    func chkBoxChanged(_ tag: Int, _ checkState: M13Checkbox.CheckState)
}

class CheckCell: UITableViewCell {

    @IBOutlet weak var chkBox: M13Checkbox!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    weak var chkCellDelegate : CheckCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // Evento de alterações no checkbox
    @IBAction func chkChanged(_ sender: M13Checkbox) {
        // Delegate a ação para a função do protocol
        chkCellDelegate?.chkBoxChanged(sender.tag, sender.checkState)
    }
}
