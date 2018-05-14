//
//  ContactSendTableViewCell.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 12/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class ContactSendTableViewCell: UITableViewCell {
  
  @IBOutlet weak var button: UIButton!
  
  var viewModel: Contact.ContactFormCell.ViewModel = Contact.ContactFormCell.ViewModel() {
    didSet {
      didSetViewModel()
    }
  }
  
  private func didSetViewModel() {
    button.setTitle(viewModel.text, for: .normal)
  }
}
