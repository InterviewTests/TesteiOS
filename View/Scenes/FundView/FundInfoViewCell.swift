//
//  FundInfoViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 25/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit


class FundInfoViewCell: UITableViewCell, FundInfoCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let theme = ThemeManager.current()
        titleLabel.textColor = theme.fundSecondaryTextColor
        dataLabel.textColor = theme.fundPrimaryTextColor
    }
    
    func configure(title: String, text: String) {
        titleLabel.text = title
        dataLabel.text = text
    }
}
