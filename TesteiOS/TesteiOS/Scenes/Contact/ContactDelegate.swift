//
//  ContactDelegate.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 21/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class ContactDelegate: NSObject, UITableViewDelegate {
  
  weak var tableView: ContactTableView?
  
  var items: [Cell] = []
  
  init(tableView: ContactTableView) {
    self.tableView = tableView
    super.init()
    self.tableView?.delegate = self
  }
  
  func update(with items: [Cell]) {
    self.items = items.filter { !$0.hidden }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let spacing = items[indexPath.row].topSpacing
    return CGFloat(50 + spacing)
  }
}
