//
//  ContactTableView.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 21/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class ContactTableView: UITableView {

  fileprivate var customDataSource: ContactDataSource?
  fileprivate var customDelegate: ContactDelegate?
  convenience init() {
    self.init(frame: .zero, style: .plain)
  }
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    customDelegate = ContactDelegate(tableView: self)
    customDataSource = ContactDataSource(tableView: self, delegate: customDelegate!)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ContactTableView {
  func update(with items: [Cell]) {
    customDelegate?.update(with: items)
    customDataSource?.update(with: items)
  }
  
  func setSendHandler(_ handler: @escaping ([Value]) -> ()) {
    customDataSource?.sendAction = handler
  }
}
