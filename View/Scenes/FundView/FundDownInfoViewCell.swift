//
//  FundDownInfoViewCell.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 25/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import UIKit


class FundDownInfoViewCell: UITableViewCell, FundDownInfoCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var imageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let theme = ThemeManager.current()
        titleLabel.textColor = theme.fundSecondaryTextColor
        button.setTitleColor(theme.primaryColor, for: .normal)
        imageButton.setImage(imageButton.image(for: .normal)?.maskWithColor(theme.primaryColor), for: .normal)
        
        titleLabel.font = theme.fundInfoFont
        imageButton.titleLabel?.font = theme.fundInfoFont
    }

    func configure(title: String, buttonText: String) {
        titleLabel.text = title
        button.setTitle(buttonText, for: .normal)
    }
    
    @IBAction func fundDownButtonPressed(_ sender: Any) {
        // Does nothing
    }
    
}
