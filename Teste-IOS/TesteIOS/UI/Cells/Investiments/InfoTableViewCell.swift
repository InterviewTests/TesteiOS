//
//  InfoTableViewCell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var lblInfoName: UILabel!
    @IBOutlet weak var lblInfoData: UILabel!
    
    func configureCell(info: DataInfo) {
        self.lblInfoName.text = info.name
        self.lblInfoData.text = ""
        
        if let data = info.data {
            self.lblInfoData.text = data
        }
    }
    
}
