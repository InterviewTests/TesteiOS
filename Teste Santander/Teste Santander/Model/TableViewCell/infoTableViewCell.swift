//
//  infoTableViewCell.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 04/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class infoTableViewCell: UITableViewCell {
    @IBOutlet weak var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(screenInfo: InvestimentScreen) {
        info.text = screenInfo.infoTitle
    }

}
