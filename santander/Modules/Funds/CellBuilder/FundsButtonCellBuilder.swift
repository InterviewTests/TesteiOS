//
//  FundsButtonCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class FundsButtonCellBuilder {
    
    var configuration: FundsButtonCell.Configuration
    var isSelectable: Bool
    private var cell: FundsButtonCell?
    
    init(configuration: FundsButtonCell.Configuration,
         isSelectable: Bool = false) {
        
        self.configuration = configuration
        self.isSelectable = isSelectable
    }
    
}

extension FundsButtonCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        return 50
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(FundsButtonCell.self,
                           forCellReuseIdentifier: FundsButtonCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: FundsButtonCell = tableView.dequeue(indexPath: indexPath)
        cell.configure(data: configuration)
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return isSelectable
    }
    
}
