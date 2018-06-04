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
    var title:Int = 0
    
    @IBOutlet weak var uiTitle: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    func setLayout() {
        
        switch title {
        case 0 :
            self.uiTitle?.text = model.title
        case 1:
            self.uiTitle?.text = model.whatIs
        case 2:
            self.uiTitle?.text = model.riskTitle
        case 3:
            self.uiTitle?.text = model.infoTitle
        default:
            print("")
        }
        

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
