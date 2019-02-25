//
//  ContactBaseTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import Reusable

class ContactBaseTableViewCell: UITableViewCell, NibReusable {
  
  @IBOutlet weak var topSpacingConstraint: NSLayoutConstraint!
  
  var callback: ((Value) -> ())?
  var sendAction: (() -> ())?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setup(with item: Cell) {
    topSpacingConstraint.constant = CGFloat(item.topSpacing)
    self.layoutIfNeeded()
  }
  
  func enableAction(_ value: Bool) {}
}
