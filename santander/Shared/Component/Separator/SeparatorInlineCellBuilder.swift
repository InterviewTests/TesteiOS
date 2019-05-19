//
//  SeparatorInlineCellBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public final class SeparatorInlineCellBuilder: TableViewCellBuilder {
    
    private var spaced: CGFloat
    
    init(spaced: CGFloat) {
        self.spaced = spaced
    }
    
    public var cellHeight: CGFloat {
        return spaced + SeparatorInlineViewCell.height
    }
    
    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(SeparatorInlineViewCell.self,
                           forCellReuseIdentifier: SeparatorInlineViewCell.identifier)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell: SeparatorInlineViewCell = tableView.dequeue(indexPath: indexPath)
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
    
}
