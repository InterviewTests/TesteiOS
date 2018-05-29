//
//  FundInfoTableViewCell.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 28/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class FundInfoTableViewCell: UITableViewCell {

    var item: Info? {
        didSet {
            let teste = item?.name
            let teste2 = item?.data
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
