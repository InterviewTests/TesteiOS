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
    
    @IBOutlet weak var yellowView: UIView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setLayout() {
       
//       1 a 5
//       0.5 a 1.5
        guard let width = yellowView?.frame.width  else {
            return
        }
        
        
        selectedRiskViewTrailingConstraint?.constant = (CGFloat(model.risk - 1) * width) + width/2 - 5
        self.setNeedsLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
