//
//  DownInfoTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class DownInfoTableViewCell: FundBaseTableViewCell {
    
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var downloadButton: UIButton!
  
  var data: String? = .none
  
  override func setup(with fund: Fund) {
    nameLabel.text = fund.downInfo[tag].name
    data = fund.downInfo[tag].data
  }
    
  @IBAction func downloadData(_ sender: UIButton){
    self.downloadAction?(data)
  }
}
