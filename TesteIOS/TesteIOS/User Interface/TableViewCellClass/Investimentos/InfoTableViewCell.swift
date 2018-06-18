//
//  InfoTableViewCell.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
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
