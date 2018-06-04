//
//  TitleTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    var model:TitleCellModel = TitleCellModel(nil)
    
    @IBOutlet weak var uiTitle: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    func setLayout() {
        self.uiTitle?.text = model.title
        print("TITLE")
        print(model.title)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
