//
//  DownInfoTableViewCell.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 01/06/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class DownInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var DINameLbl: UILabel!
    @IBOutlet weak var DIBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func DIBtnWasPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
}
