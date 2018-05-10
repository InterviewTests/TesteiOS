//
//  RiskTableViewCell.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit
class RiskTableDataViewCell:RiskTableViewCellProtocol{
    var name: String
    var image: UIImage
    var index:Int
    
    init(with screen:Screen) {
        self.name = screen.screen.riskTitle
        self.index = screen.screen.risk
        print("selectedRedRisk\(screen.screen.risk)")
        guard let image = UIImage(named: "selectedRisk\(screen.screen.risk)") else{
            self.image = #imageLiteral(resourceName: "Risk1lightGreen")
            return
        }
        self.image = image
    }
}


protocol RiskTableViewCellProtocol{
    var name:String{get}
    var image:UIImage{get}
    var index:Int{get}
}

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
    
    func setup(with model:RiskTableViewCellProtocol){
        self.title.text = model.name
        dump(model)
        switch model.index {
        case 1:
            imageRisk1.image = model.image
        case 2:
            imageRisk2.image = model.image
        case 3:
            imageRisk3.image = model.image
        case 4:
            imageRisk4.image = model.image
        case 5:
            imageRisk5.image = model.image
 
        default:
            imageRisk1.image = model.image
        }
    }
}
