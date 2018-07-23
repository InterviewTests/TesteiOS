//
//  InfoCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {
    
    @IBOutlet var infoTitleLabel: UILabel!
    @IBOutlet var infoDetailLabel: UILabel!
    
    static let identifier:String = "InfoCell"
    static var nib:UINib{
        let nibInfo = UINib(nibName: "InfoCell", bundle: nil)
        return nibInfo
    }
    
    func populate(info:ScreenInfo){
        if let name = info.name{
            infoTitleLabel.text = name
        }
        if let data = info.data{
            infoDetailLabel.text = data
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
