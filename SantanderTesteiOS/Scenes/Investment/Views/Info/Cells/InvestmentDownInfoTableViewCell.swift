//
//  InvestmentDownInfoTableViewCell.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

class InvestmentDownInfoTableViewCell: UITableViewCell {
    @IBOutlet private weak var nameLabel : UILabel!
    
    private var fundable : Fundable!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func set(fundable : Fundable) {
        self.fundable = fundable
        self.setupInterface()
    }
    
    private func setupInterface() {
        self.nameLabel.text = self.fundable.name
    }
    
    
}
