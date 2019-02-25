//
//  ContactDataSource.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 21/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

typealias Value = (message: String, data: Any)

class ContactDataSource: NSObject, ItemsTableViewDataSource {
  
  var items: [Cell] = []
  var tableView: UITableView?
  var delegate: UITableViewDelegate?
  var values: [Value] = []
  var enableSendButton: ((Bool) -> ())?
  var sendAction: (([Value]) -> ())?
  
  required init(tableView: UITableView, delegate: UITableViewDelegate) {
    self.tableView = tableView
    self.delegate = delegate
    super.init()
    setupTableView()
  }
  
  func registerTableView() {
    for item in items {
      let type = CellType(rawValue: item.type)!
      self.tableView?.register(type.getNib(), forCellReuseIdentifier: type.getIdentifier())
    }
  }
  
  func update(with items: [Cell]) {
    self.items = items.filter { !$0.hidden }
    self.registerTableView()
    self.tableView?.reloadData()
  }
  
  func sendButtonPressed() {
    sendAction?(values)
    values = []
  }
  
  func validValue(_ value: Value) {
    if values.contains(where: { $0.message == value.message }) {
      for i in 0..<values.count {
        guard values.count > i else { return }
        if values[i].message == value.message {
          values[i].data = value.data
          if let data = value.data as? String, data.isEmpty {
            values.remove(at: i)
            enableSendButton?(false)
          }
        }
      }
    } else {
      values.append(value)
    }
    enableSendButton?(values.count == items.count - 2)
  }
}

extension ContactDataSource: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    let type = CellType(rawValue: item.type)!
    let cell = tableView.dequeueReusableCell(withIdentifier: type.getIdentifier(), for: indexPath) as! ContactBaseTableViewCell
    enableSendButton = cell.enableAction
    cell.sendAction = sendButtonPressed
    cell.callback = validValue
    cell.setup(with: item)
    return cell
  }
}
