//
//  headerTableViewCell.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 04/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class headerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    func prepare(screenInfo: InvestimentScreen) {
        title.text = screenInfo.title
        subTitle.text = screenInfo.fundName
        
        title.font = UIFont(name: "DINPro-Regular", size: 14.0)
        subTitle.font = UIFont(name: "DINPro-Medium", size: 24.0)
        
    }

}
