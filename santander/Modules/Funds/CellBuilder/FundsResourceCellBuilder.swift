//
//  FundsResourceCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class FundsResourceCellBuilder {
    
    public var tapAction: (() -> Void)?
    
    var configuration: FundsResourceCell.Configuration
    var isSelectable: Bool
    
    init(configuration: FundsResourceCell.Configuration,
         tapAction: (() -> Void)?,
         isSelectable: Bool = false) {
        
        self.configuration = configuration
        self.isSelectable = isSelectable
        self.tapAction = tapAction
    }
    
}

extension FundsResourceCellBuilder: TableViewCellBuilder {
    
    public var cellHeight: CGFloat {
        return 32
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(FundsResourceCell.self,
                           forCellReuseIdentifier: FundsResourceCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: FundsResourceCell = tableView.dequeue(indexPath: indexPath)
        cell.configure(data: configuration)
        cell.tapAction = self.tapAction
        
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return isSelectable
    }
    
}


