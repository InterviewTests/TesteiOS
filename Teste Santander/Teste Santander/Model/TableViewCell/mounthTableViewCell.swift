//
//  mounthTableViewCell.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 04/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class mounthTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var valueFund: UILabel!
    @IBOutlet weak var valueCD: UILabel!
    
    var labels: [String] = ["No mês", "No ano", "12 Meses"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(screenInfo: InvestimentScreen, index: Int) {
        title.text = labels[index]
        switch index {
        case 0:
            valueFund.text = String(format: "%.2f", screenInfo.moreInfo.month.fund)
            valueCD.text = String(format: "%.2f", screenInfo.moreInfo.month.CDI)
        case 1:
            valueFund.text = String(format: "%.2f", screenInfo.moreInfo.year.fund)
            valueCD.text = String(format: "%.2f", screenInfo.moreInfo.year.CDI)
        default:
            valueFund.text = String(format: "%.2f", screenInfo.moreInfo.twelveMonths.fund)
            valueCD.text = String(format: "%.2f", screenInfo.moreInfo.twelveMonths.CDI)
        }
        
    }

}
