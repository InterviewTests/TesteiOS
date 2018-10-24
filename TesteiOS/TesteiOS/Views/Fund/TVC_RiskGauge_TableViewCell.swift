//
//  TVC_RiskGauge_TableViewCell.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class TVC_RiskGauge_TableViewCell: UITableViewCell {

    @IBOutlet weak var Gauge_0: UIImageView!
    @IBOutlet weak var Gauge_1: UIImageView!
    @IBOutlet weak var Gauge_2: UIImageView!
    @IBOutlet weak var Gauge_3: UIImageView!
    @IBOutlet weak var Gauge_4: UIImageView!
    @IBOutlet weak var Gauge_0_Height_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Gauge_1_Height_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Gauge_2_Height_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Gauge_3_Height_Constraint: NSLayoutConstraint!
    @IBOutlet weak var Gauge_4_Height_Constraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Gauge_0.image = #imageLiteral(resourceName: "Icone Risco Grau 1 Off")
        Gauge_1.image = #imageLiteral(resourceName: "Icone Risco Grau 2 Off")
        Gauge_2.image = #imageLiteral(resourceName: "Icone Risco Grau 3 Off")
        Gauge_3.image = #imageLiteral(resourceName: "Icone Risco Grau 4 Off")
        Gauge_4.image = #imageLiteral(resourceName: "Icone Risco Grau 5 Off")
        
        Gauge_0_Height_Constraint.constant = 6
        Gauge_1_Height_Constraint.constant = 6
        Gauge_2_Height_Constraint.constant = 6
        Gauge_3_Height_Constraint.constant = 6
        Gauge_4_Height_Constraint.constant = 6
    }
    
    func setGauge( index: Int){
        // decide qual indicador de risco será destacado
        switch index{
        case 1:
            Gauge_0.image = #imageLiteral(resourceName: "Icone Risco Grau 1 On")
            Gauge_0_Height_Constraint.constant = 10
        case 2:
            Gauge_1.image = #imageLiteral(resourceName: "Icone Risco Grau 2 On")
            Gauge_1_Height_Constraint.constant = 10
        case 3:
            Gauge_2.image = #imageLiteral(resourceName: "Icone Risco Grau 3 On")
            Gauge_2_Height_Constraint.constant = 10
        case 4:
            Gauge_3.image = #imageLiteral(resourceName: "Icone Risco Grau 4 On")
            Gauge_3_Height_Constraint.constant = 10
        case 5:
            Gauge_4.image = #imageLiteral(resourceName: "Icone Risco Grau 5 On")
            Gauge_4_Height_Constraint.constant = 10
        default:
            Gauge_4.image = #imageLiteral(resourceName: "Icone Risco Grau 5 On")
            Gauge_4_Height_Constraint.constant = 10
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
