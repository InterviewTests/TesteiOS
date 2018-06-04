//
//  NameTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    var model:NameCellModel = NameCellModel(nil)
    
    @IBOutlet weak var uiName: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()


        // Initialization code
    }
    
    func setLayout() {
        uiName?.text = model.fundName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
