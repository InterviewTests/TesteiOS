//
//  FundsButtonCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class FundsButtonCellBuilder {
    
    private var cell: FundsButtonCell?
    private var isSelectable: Bool
    private var actionClosure: (() -> Void)?
    private var configuration: FundsButtonCell.Configuration
    
    init(configuration: FundsButtonCell.Configuration,
         tapAction: (() -> Void)?,
         isSelectable: Bool = false) {
        
        self.configuration = configuration
        self.actionClosure = tapAction
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
        cell.button.buttonAction = actionClosure
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return isSelectable
    }
    
}
