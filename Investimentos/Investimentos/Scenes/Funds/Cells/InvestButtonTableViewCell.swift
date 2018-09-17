//
//  InvestButtonTableViewCell.swift
//  Investimentos
//
//  Created by Cmdev on 17/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class InvestButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var investButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        investButton.addTarget(self, action: #selector(InvestButtonTableViewCell.holdDown), for: .touchUpInside)
        investButton.addTarget(self, action: #selector(InvestButtonTableViewCell.holdRelease), for: .touchDown)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Animate button
    @objc private func holdDown() {
        investButton.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 1)
    }
    
    @objc private func holdRelease() {
        investButton.backgroundColor = #colorLiteral(red: 0.8334353566, green: 0.1204492822, blue: 0, alpha: 0.7028306935)
    }

}
