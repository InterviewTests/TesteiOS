//
//  ButtonTableViewCell.swift
//  iOSTest
//
//  Created by erick.peripolli on 30/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var sendButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title: String) {
        self.sendButton.setTitle(title, for: .normal)
    }

    @IBAction func tappedSend(_ sender: UIButton) {
        sender.animate()
    }
}
