//
//  InfoTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class InfoTableViewCell: FundBaseTableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var dataLabel: UILabel!
  
  override func setup(with fund: Fund) {
    nameLabel.text = fund.info[tag].name
    dataLabel.text = fund.info[tag].data
  }
}
