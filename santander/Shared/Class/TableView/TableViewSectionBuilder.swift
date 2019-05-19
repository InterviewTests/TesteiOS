//
//  TableViewSectionBuilder.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public protocol TableViewSectionBuilder {
    
    var numberOfRows: Int { get }
    
    func registerCells(in tableView: UITableView)
    
    func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell
    
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath)
    func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool
    
    func tableViewSectionHeader(_ tableView: UITableView) -> UIView?
    func tableViewSectionFooter(_ tableView: UITableView) -> UIView?
    func tableViewSectionHeaderHeight(_ tableView: UITableView) -> CGFloat
    func tableViewSectionFooterHeight(_ tableView: UITableView) -> CGFloat
    
}

public extension TableViewSectionBuilder {
    
    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableViewSectionHeader(_ tableView: UITableView) -> UIView? {
        return nil
    }
    
    func tableViewSectionFooter(_ tableView: UITableView) -> UIView? {
        return nil
    }
    
}
