//
//  TitleTableViewCell.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 01/06/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    @IBOutlet weak var fundTitleLbl: UILabel!
    @IBOutlet weak var fundNameLbl: UILabel!
    @IBOutlet weak var line1Img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
