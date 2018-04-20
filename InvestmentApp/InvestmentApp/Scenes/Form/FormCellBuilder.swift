//
//  FormCellBuilder.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class FormCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    let items: [CellModel]
    
    init(items: [CellModel], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
    }
    
    func registerCell() {
        tableView.register(InputTextCell.self, forCellReuseIdentifier: "InputTextCell")
    }
    
    func build() -> TableSectionable {
        return BaseSection(cellBuilder: self, in: tableView)
    }
    
    func estimatedCellHeight(indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextCell") as? InputTextCell else {
            fatalError("Must be provide a InputTextCell")
        }
        cell.setup()
        return cell
    }
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func reuseIdentifier() -> String {
        return ""
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        //delegate?.didSelectItemAt(indexPath)
    }
}
