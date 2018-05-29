//
//  FundRiskTableViewCell.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 28/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class FundRiskTableViewCell: UITableViewCell {
    @IBOutlet weak var riskTitleLbl: UILabel!
    @IBOutlet weak var riskLbl: UILabel!
    
    var item: FundViewModelItem? {
        didSet {
            guard let item = item as? FundViewModelRiskItem else{return}
            riskTitleLbl.text = item.riskTitle
            riskLbl.text = String (item.risk)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    static var identifier: String {
        return String(describing: self)
    }
}
