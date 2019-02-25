//
//  CheckboxTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

final class CheckboxTableViewCell: ContactBaseTableViewCell {

  @IBOutlet weak var checkboxButton: UIButton!
  
  override func setup(with item: Cell) {
    super.setup(with: item)
    checkboxButton.isSelected = false
    checkboxButton.setImage(UIImage(named: "checkboxEmpty"), for: .normal)
    checkboxButton.setTitle(item.message, for: .normal)
    callback?((item.message, false))
  }
    
  @IBAction func checkboxButtonPressed(_ sender: UIButton) {
    if sender.isSelected {
      sender.isSelected = false
      sender.setImage(UIImage(named: "checkboxEmpty"), for: .normal)
    } else {
      sender.isSelected = true
      sender.setImage(UIImage(named: "checkboxFilled"), for: .normal)
    }
    callback?((sender.title(for: .normal)!, sender.isSelected))
  }
}
