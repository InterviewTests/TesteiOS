//
//  FundsThreeColumnsCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class FundsThreeColumnsCellBuilder {
    
    var configuration: FundsThreeColumnsCell.Configuration
    var isSelectable: Bool
    
    init(configuration: FundsThreeColumnsCell.Configuration,
         isSelectable: Bool = false) {
        
        self.configuration = configuration
        self.isSelectable = isSelectable
    }
    
}

extension FundsThreeColumnsCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        return 32
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(FundsThreeColumnsCell.self,
                           forCellReuseIdentifier: FundsThreeColumnsCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: FundsThreeColumnsCell = tableView.dequeue(indexPath: indexPath)
        cell.configure(data: configuration)
        
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return isSelectable
    }
    
}

