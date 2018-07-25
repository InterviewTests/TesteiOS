//
//  BaseCell.swift
//  FinForm
//
//  Created by Gustavo on 25/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    
    var cellMetaData:CellMetaData!
    var index:Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
