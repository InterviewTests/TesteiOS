//
//  InfoDownTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class InfoDownTableViewCell: FundBaseTableViewCell {
    
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var downloadButton: UIButton!

  override func awakeFromNib() {
      super.awakeFromNib()
  }
  
  override func setup(with fund: Fund) {
    nameLabel.text = fund.downInfo[tag].name
  }
    
  @IBAction func downloadData(_ sender: UIButton){
      UIApplication.shared.openURL(NSURL(string: "http://www.google.com")! as URL)
  }
}
