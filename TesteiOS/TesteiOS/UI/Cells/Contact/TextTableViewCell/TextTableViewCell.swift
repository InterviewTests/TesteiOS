//
//  TextTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

final class TextTableViewCell: ContactBaseTableViewCell {

  @IBOutlet weak var messageLabel: UILabel!

  override func awakeFromNib() {
      super.awakeFromNib()
  }
  
  override func setup(with item: Cell) {
    super.setup(with: item)
    messageLabel.text = item.message
  }
}
