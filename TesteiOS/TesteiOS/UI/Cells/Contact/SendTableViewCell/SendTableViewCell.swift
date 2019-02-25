//
//  SendTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

final class SendTableViewCell: ContactBaseTableViewCell {

  @IBOutlet weak var sendButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    sendButton.layer.cornerRadius = sendButton.frame.height / 2
  }
  
  override func setup(with item: Cell) {
    super.setup(with: item)
    sendButton.isUserInteractionEnabled = false
    sendButton.transform = CGAffineTransform.identity
    sendButton.backgroundColor = ColorPalette.middleRedPurple
    sendButton.setTitle(item.message, for: .normal)
    sendButton.addTarget(self, action: #selector(sendButtonPressed(_:)), for: .touchUpInside)
  }
  
  override func enableAction(_ value: Bool) {
    sendButton.backgroundColor = value ? ColorPalette.rossoCorsa : ColorPalette.middleRedPurple
    sendButton.isUserInteractionEnabled = value
  }
  
  @objc func sendButtonPressed(_ sender: UIButton) {
    UIView.animate(withDuration: 0.2, animations: {
      sender.backgroundColor = ColorPalette.middleRedPurple
      sender.transform = CGAffineTransform(scaleX: 0.90, y: 0.83)
    }) { completed in
      self.sendAction?()
    }
  }
}
