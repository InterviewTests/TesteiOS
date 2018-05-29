//
//  ThreeLabelTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit

class ThreeLabelTableViewCell: UITableViewCell {
    var model:ThreeLabelCellModel = ThreeLabelCellModel(nil,nil,nil,nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
