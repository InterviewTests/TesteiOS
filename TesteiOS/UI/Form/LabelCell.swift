//
//  LabelCell.swift
//  TesteiOS
//
//  Created by Macbook on 09/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
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
