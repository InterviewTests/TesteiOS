//
//  FundsTableView.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 24/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class FundsTableView: UITableView {

  fileprivate var customDataSource: FundsDataSource?
  fileprivate var customDelegate: FundsDelegate?
  convenience init() {
    self.init(frame: .zero, style: .plain)
  }
  
  override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
    customDelegate = FundsDelegate(tableView: self)
    customDataSource = FundsDataSource(tableView: self, delegate: customDelegate!)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension FundsTableView {
  func update(with fund: Fund) {
    customDataSource?.update(with: fund)
  }
  
  func setInvestHandler(_ handler: @escaping () -> ()) {
    customDataSource?.investAction = handler
  }
  
  func setDownloadHandler(_ handler: @escaping (String?) -> ()) {
    customDataSource?.downloadAction = handler
  }
}
