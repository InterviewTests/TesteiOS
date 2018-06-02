//
//  RiskTableViewCell.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 01/06/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class RiskTableViewCell: UITableViewCell {
    @IBOutlet weak var riskTitleLbl: UILabel!
    @IBOutlet weak var risk1Img: UIImageView!
    @IBOutlet weak var risk2Img: UIImageView!
    @IBOutlet weak var risk3Img: UIImageView!
    @IBOutlet weak var risk4Img: UIImageView!
    @IBOutlet weak var risk5Img: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
