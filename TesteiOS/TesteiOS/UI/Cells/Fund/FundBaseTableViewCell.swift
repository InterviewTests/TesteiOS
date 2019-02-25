//
//  FundBaseTableViewCell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 24/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import Reusable

class FundBaseTableViewCell: UITableViewCell, NibReusable {
  func setup(with fund: Fund) {}
  var investAction: (() -> ())?
  var downloadAction: ((String?) -> ())?
}
