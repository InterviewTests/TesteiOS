//
//  RiskTableViewCell.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit

class RiskTableViewCell: UITableViewCell {
    var model:RiskCellModel = RiskCellModel(nil)
    
    @IBOutlet weak var selectedRiskView: UIImageView?
    @IBOutlet weak var selectedRiskViewTrailingConstraint: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(model.risk)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
