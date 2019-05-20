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
    private var style: SeparatorInlineViewCell.Style
    
    init(style: SeparatorInlineViewCell.Style = .none,
         spaced: CGFloat) {
        
        self.spaced = spaced
        self.style = style
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
        cell.style = style
        return cell
    }
    
    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
    
}
