//
//  RiskTableViewCell.swift
//  Investimentos
//
//  Created by Cmdev on 13/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class RiskTableViewCell: UITableViewCell {

    @IBOutlet weak var riskDegreeLabel: UILabel!
    @IBOutlet var riskIndicators: [UIImageView]!
    @IBOutlet var riskColors: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*
         > arredondando bordas
            1. superior esquerda e inferior esquerda: primeiro item
            2. superior direita e inferior direita: último item
        */
        riskColors.first?.roundCorners([.bottomLeft, .topLeft], radius: 5)
        riskColors.last?.roundCorners([.bottomRight, .topRight], radius: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func selectRisk(risk: Int) {
        //Indicator
        for indicator in riskIndicators {
            indicator.isHidden = true
        }
        let indicatorSelected = riskIndicators.filter { (indicator) -> Bool in
            return indicator.tag == risk
        }
        indicatorSelected.first?.isHidden = false
        
        //Color
        for color in riskColors {
            color.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1)
        }
        let colorSelected = riskColors.filter { (color) -> Bool in
            return color.tag == risk
        }
        colorSelected.first?.transform = CGAffineTransform.identity.scaledBy(x: 1, y: 1.5)
    }

}
