//
//  TextTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    var model:TextCellModel = TextCellModel(nil)
    
    @IBOutlet weak var uiText: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
            self.uiText?.translatesAutoresizingMaskIntoConstraints = false
        // Initialization code
    }

    
    func setLayout() {
        uiText?.text = model.definition
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
