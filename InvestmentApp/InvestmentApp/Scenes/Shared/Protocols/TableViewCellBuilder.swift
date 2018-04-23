//
//  TableViewCellBuilder.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

protocol TableViewCellBuilder {
    func estimatedCellHeight(indexPath: IndexPath) -> CGFloat
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    func numberOfItems() -> Int
    func registerCell()
}
