//
//  SendCell.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class SendCell: UITableViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    static let reuseIdentifier = "SendCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLayout()
    }
    
    private func configureLayout() {
        button.backgroundColor = UIColor.darkRedColor
        button.layer.cornerRadius = 25
    }
}
