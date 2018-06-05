//
//  ButtonTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 04/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var uiBtn: RedButton?
    var title:String = ""

    override func awakeFromNib() {
        super.awakeFromNib()

        
        // Initialization code
    }

    func setBtnTitle() {
        self.uiBtn?.setTitle(self.title, for: UIControlState.normal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
