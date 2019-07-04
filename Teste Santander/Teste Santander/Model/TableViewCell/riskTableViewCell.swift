//
//  riskTableViewCell.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 04/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class riskTableViewCell: UITableViewCell {
    @IBOutlet weak var risk: UILabel!
    @IBOutlet var segRisk: [UIView]!
    @IBOutlet var arrowRick: [UIImageView]!
    @IBOutlet var width: [NSLayoutConstraint]!
    @IBOutlet var height: [NSLayoutConstraint]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(screenInfo: InvestimentScreen) {
        risk.text = screenInfo.riskTitle
        width[screenInfo.risk - 1].constant = 65
        height[screenInfo.risk - 1].constant = 13
        arrowRick[screenInfo.risk - 1].isHidden = false
    }

}
