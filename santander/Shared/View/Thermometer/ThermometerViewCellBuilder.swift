//
//  ThermometerViewCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class ThermometerViewCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        return 25
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(ThermometerViewCell.self,
                           forCellReuseIdentifier: ThermometerViewCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: ThermometerViewCell = tableView.dequeue(indexPath: indexPath)
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
    
}

