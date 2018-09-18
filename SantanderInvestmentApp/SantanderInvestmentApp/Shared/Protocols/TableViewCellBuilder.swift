//
//  TableViewCellBuilder.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellBuilder {
    func estimatedCellHeight(indexPath: IndexPath) -> CGFloat
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
    func numberOfItems() -> Int
    func registerCell()
}
