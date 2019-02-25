//
//  InvestTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 24/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class InvestTableViewCell: FundBaseTableViewCell {
  
  @IBOutlet weak var investButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    investButton.layer.cornerRadius = investButton.frame.height / 2
    investButton.setTitle("Investir", for: .normal)
  }
    
  @IBAction func investButtonPressed(_ sender: UIButton) {
    UIView.animate(withDuration: 0.2, animations: {
      sender.backgroundColor = ColorPalette.middleRedPurple
      sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.83)
    }) { completed in
      UIView.animate(withDuration: 0.2, animations: {
        self.investAction?()
        sender.backgroundColor = ColorPalette.rossoCorsa
        sender.transform = CGAffineTransform.identity
      })
    }
  }
}
