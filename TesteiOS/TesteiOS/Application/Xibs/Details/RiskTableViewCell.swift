//
//  RiskTableViewCell.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 08/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit

class RiskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageRisk3: UIImageView!
    @IBOutlet weak var imageRisk1: UIImageView!
    @IBOutlet weak var imageRisk2: UIImageView!
    @IBOutlet weak var imageRisk4: UIImageView!
    @IBOutlet weak var imageRisk5: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func register(to tableView:UITableView) {
        let nib = UINib(nibName: "RiskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RiskTableViewCell")
    }
    
    func setup(riskObj:RiskScreen) {
        
        self.title.text = riskObj.title
        switch riskObj.risk {
        case 1:
            self.imageRisk1.image = UIImage(named: "selectedGreenRisk1")
        case 2:
            self.imageRisk2.image = UIImage(named: "selectedGreenRisk2")
        case 3:
            self.imageRisk3.image = UIImage(named: "selectedGreenRisk3")
        case 4:
            self.imageRisk4.image = UIImage(named: "selectedGreenRisk4")
        case 5:
            self.imageRisk5.image = UIImage(named: "selectedGreenRisk5")
        default:
            self.imageRisk1.image = UIImage(named: "selectedGreenRisk1")
        }
        
    }
    
}
