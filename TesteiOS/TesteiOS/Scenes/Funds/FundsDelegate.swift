//
//  FundsDelegate.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class FundsDelegate: NSObject, UITableViewDelegate {
  
  weak var tableView: UITableView?
  
  var items: [CellType] = [.fundHeader, .moreInfo, .info, .downInfo, .invest]
  
  init(tableView: UITableView) {
    self.tableView = tableView
    super.init()
    self.tableView?.delegate = self
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return items[indexPath.section].getHeight()
  }
}
