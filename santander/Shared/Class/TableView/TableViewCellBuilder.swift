//
//  TableViewCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public protocol TableViewCellBuilder {
    
    var cellHeight: CGFloat { get }
    
    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    func tableViewDidSelectCell(_ tableView: UITableView)
    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    
}

public extension TableViewCellBuilder {
    
    func tableViewDidSelectCell(_ tableView: UITableView) {}
    
}
