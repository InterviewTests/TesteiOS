//
//  ContactTextTableViewCell.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class ContactTextTableViewCell: UITableViewCell {
  
  @IBOutlet weak var textTitleLabel: UILabel!
  
  var viewModel: Contact.ContactFormCell.ViewModel = Contact.ContactFormCell.ViewModel() {
    didSet {
      didSetViewModel()
    }
  }
  
  private func didSetViewModel() {
    textTitleLabel.text = viewModel.text
  }
  
}
