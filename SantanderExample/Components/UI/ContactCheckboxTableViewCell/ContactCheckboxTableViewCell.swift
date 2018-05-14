//
//  ContactCheckboxTableViewCell.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class ContactCheckboxTableViewCell: UITableViewCell {
  
  @IBOutlet weak var checkbox: UIButton!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var kBottomAnchor: NSLayoutConstraint!
  
  private var checkboxSelected: Bool = false
  
  var viewModel: Contact.ContactFormCell.ViewModel = Contact.ContactFormCell.ViewModel() {
    didSet {
      didSetViewModel()
    }
  }
  
  private func didSetViewModel() {
    titleLabel.text = viewModel.text
  }
  
  @IBAction func checkboxTouchUpInside(_ sender: Any) {
    checkboxSelected = !checkboxSelected
    
    if checkboxSelected {
      checkbox.setImage(UIImage(named: "checkbox-checked-icon") ?? UIImage(), for: .normal)
    } else {
      checkbox.setImage(UIImage(named: "checkbox-unchecked-icon") ?? UIImage(), for: .normal)
    }
  }
  
}
