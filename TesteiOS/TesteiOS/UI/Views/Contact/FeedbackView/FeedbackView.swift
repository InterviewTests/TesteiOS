//
//  FeedbackView.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class FeedbackView: UIView {
  class func loadFromNib() -> FeedbackView {
    let nib = UINib(nibName: String(describing: self), bundle: .main)
    return nib.instantiate(withOwner: nil, options: nil).first as! FeedbackView
  }
  
  @IBAction func sendButtonPressed(_ sender: UIButton) {
    UIView.animate(withDuration: 0.2) {
      self.alpha = 0
    }
  }
}
