//
//  SendButtonTableViewCell.swift
//  Investimentos
//
//  Created by Cmdev on 11/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class SendButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var sendButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sendButton.addTarget(self, action: #selector(SendButtonTableViewCell.holdDown), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(SendButtonTableViewCell.holdRelease), for: .touchDown)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - Animate button
    @objc private func holdDown() {
        sendButton.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 1)
    }
    
    @objc private func holdRelease() {
        sendButton.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 0.7028306935)
    }
}
