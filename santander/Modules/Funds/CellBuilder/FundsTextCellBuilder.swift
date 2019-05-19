//
//  FundsTextCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class FundsTextCellBuilder {
    
    var configuration: FundsTextCell.Configuration
    var isSelectable: Bool
    
    init(configuration: FundsTextCell.Configuration,
         isSelectable: Bool = false) {
        
        self.configuration = configuration
        self.isSelectable = isSelectable
    }
    
}

extension FundsTextCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        return 97
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(FundsTextCell.self,
                           forCellReuseIdentifier: FundsTextCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: FundsTextCell = tableView.dequeue(indexPath: indexPath)
        cell.configure(data: configuration)
        
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return isSelectable
    }
    
}

