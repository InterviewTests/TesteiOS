//
//  ChangeRegisterTableViewCell.swift
//  TesteiOS
//
//  Created by Naville Brasil on 18/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit
import BEMCheckBox

class ChangeRegisterTableViewCell: UITableViewCell
{
    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var labelChangeRegister: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        //Setting checkbox style
        self.checkBox.boxType = .square
        //Setting time of animation
        self.checkBox.animationDuration = 0.2
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
