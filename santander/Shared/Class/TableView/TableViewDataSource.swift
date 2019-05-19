//
//  TableViewDataSource.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class TableViewDataSource: NSObject {
    
    private var sections: [TableViewSectionBuilder] = []
    
    public init(sections: [TableViewSectionBuilder], tableView: UITableView) {
        self.sections = sections
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        registerCells(in: tableView)
    }
    
    private func registerCells(in tableView: UITableView) {
        for section in sections {
            section.registerCells(in: tableView)
        }
    }
    
    private func section(at indexPath: IndexPath) -> TableViewSectionBuilder {
        return sections[indexPath.section]
    }
    
    public func insertSection(section: TableViewSectionBuilder) {
        self.sections.append(section)
    }
    
}

extension TableViewDataSource: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = self.section(at: indexPath)
        return section.tableViewCell(at: indexPath, on: tableView)
    }
    
}

extension TableViewDataSource: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = self.section(at: indexPath).cellHeight(forCellAt: indexPath, on: tableView)
        return size
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return section(at: indexPath).tableViewCell(tableView, shouldSelectCellAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        section(at: indexPath).tableViewCell(tableView, didSelectCellAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if !section(at: indexPath).tableViewCell(tableView, shouldSelectCellAt: indexPath) {
            return nil
        }
        
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sections[section].tableViewSectionFooter(tableView)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].tableViewSectionHeader(tableView)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections[section].tableViewSectionFooterHeight(tableView)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].tableViewSectionHeaderHeight(tableView)
    }
    
}

