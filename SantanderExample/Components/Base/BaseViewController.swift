//
//  BaseViewController.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 12/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  
  func showAlert(title: String, message: String, actions: [UIAlertAction] ) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    for action in actions {
      alert.addAction(action)
    }
    
    present(alert, animated: true, completion: nil)
  }

}
