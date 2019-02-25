//
//  FundsDataSource.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class FundsDataSource: NSObject, ItemsTableViewDataSource {
  
  var items: [CellType] = []
  var fund: Fund? = .none
  var tableView: UITableView?
  var delegate: UITableViewDelegate?
  var investAction: (() -> ())?
  var downloadAction: ((String?) -> ())?
  
  required init(tableView: UITableView, delegate: UITableViewDelegate) {
    self.tableView = tableView
    self.delegate = delegate
    super.init()
    setupTableView()
  }
  
  func registerTableView() {
    for item in items {
      self.tableView?.register(item.getNib(), forCellReuseIdentifier: item.getIdentifier())
    }
  }
  
  func update(with fund: Fund) {
    self.fund = fund
    self.items = [.fundHeader, .moreInfo, .info, .downInfo, .invest]
    self.registerTableView()
    self.tableView?.reloadData()
  }
}

extension FundsDataSource: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0, 1, 4 :
      return 1
    case 2:
      return fund!.info.count
    case 3:
      return fund!.downInfo.count
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let type = items[indexPath.section]
    let cell = tableView.dequeueReusableCell(withIdentifier: type.getIdentifier(), for: indexPath) as! FundBaseTableViewCell
    
    cell.tag = indexPath.row
    cell.investAction = investAction
    cell.downloadAction = downloadAction
    cell.setup(with: fund!)
    
    return cell
  }
}
