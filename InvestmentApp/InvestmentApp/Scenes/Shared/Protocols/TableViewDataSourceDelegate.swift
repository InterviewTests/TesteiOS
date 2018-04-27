//
//  TableViewDataSourceDelegate.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation
import UIKit

protocol TableSectionable {
    init(cellBuilder: TableViewCellBuilder, in tableView: UITableView)
    
    func numberOfRows() -> Int
    func cellHeightForIndexPath(_ indexPath: IndexPath,
                                in tableView: UITableView) -> CGFloat
    func cellForIndexPath(_ indexPath: IndexPath,
                          in tableView: UITableView) -> UITableViewCell
    func headerView() -> UIView?
    func headerViewHeight() -> CGFloat
    
    func footerView() -> UIView?
    func footerViewHeight() -> CGFloat
}

class BaseSection: TableSectionable {
    let cellBuilder: TableViewCellBuilder
    
    required init(cellBuilder: TableViewCellBuilder, in tableView: UITableView) {
        self.cellBuilder = cellBuilder
    }
    
    func numberOfRows() -> Int {
        return cellBuilder.numberOfItems()
    }
    
    func cellForIndexPath(_ indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return cellBuilder.cellAt(indexPath: indexPath, in: tableView)
    }
    
    func cellHeightForIndexPath(_ indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return cellBuilder.estimatedCellHeight(indexPath: indexPath)
    }
    
    func headerView() -> UIView? {
        return nil
    }
    
    func headerViewHeight() -> CGFloat {
        return 0
    }
    
    func footerView() -> UIView? {
        return nil
    }
    
    func footerViewHeight() -> CGFloat {
        return 0.0
    }
}

class SectionWithFooter: TableSectionable {
    let cellBuilder: TableViewCellBuilder
    
    required init(cellBuilder: TableViewCellBuilder, in tableView: UITableView) {
        self.cellBuilder = cellBuilder
    }
    
    func numberOfRows() -> Int {
        return cellBuilder.numberOfItems()
    }
    
    func cellForIndexPath(_ indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return cellBuilder.cellAt(indexPath: indexPath, in: tableView)
    }
    
    func cellHeightForIndexPath(_ indexPath: IndexPath, in tableView: UITableView) -> CGFloat {
        return cellBuilder.estimatedCellHeight(indexPath: indexPath)
    }
    
    func headerView() -> UIView? {
        return nil
    }
    
    func headerViewHeight() -> CGFloat {
        return 0
    }
    
    func footerView() -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 1))
        view.backgroundColor = UIColor.tableSeparatorGray
        return view
    }
    
    func footerViewHeight() -> CGFloat {
        return 1.0
    }
}

protocol TableViewSectionableDelegate: class {
    func didSelectRowAt(indexPath: IndexPath)
}

class TableViewSectionableDataSourceDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Data Source
    let sections: [TableSectionable]
    weak var delegate: TableViewSectionableDelegate?
    
    init(sections: [TableSectionable]) {
        self.sections = sections
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionObj = sections[section]
        return sectionObj.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        return section.cellForIndexPath(indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.section]
        return section.cellHeightForIndexPath(indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionObj = sections[section]
        return sectionObj.headerView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionObj = sections[section]
        return sectionObj.headerViewHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRowAt(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionObj = sections[section]
        return sectionObj.footerView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionObj = sections[section]
        return sectionObj.footerViewHeight()
    }
}
