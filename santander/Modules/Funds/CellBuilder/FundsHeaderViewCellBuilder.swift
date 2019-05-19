//
//  FundsHeaderViewCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class FundsHeaderViewCellBuilder {
    
    var configuration: FundsHeaderViewCell.Configuration
    var isSelectable: Bool
    
    init(configuration: FundsHeaderViewCell.Configuration,
         isSelectable: Bool = false) {
        
        self.configuration = configuration
        self.isSelectable = isSelectable
    }
    
}

extension FundsHeaderViewCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        return 108
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(FundsHeaderViewCell.self,
                           forCellReuseIdentifier: FundsHeaderViewCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: FundsHeaderViewCell = tableView.dequeue(indexPath: indexPath)
        cell.configure(data: configuration)
        
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return isSelectable
    }
    
}
