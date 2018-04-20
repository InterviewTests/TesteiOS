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
        tableView.register(TextCell.self, forCellReuseIdentifier: "TextCell")
    }
    
    func build() -> TableSectionable {
        return BaseSection(cellBuilder: self, in: tableView)
    }
    
    func estimatedCellHeight(indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item.type {
        case .text:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as? TextCell else {
                fatalError("Must be provide a TextCell")
            }
            cell.setup(title: item.message)
            return cell
        case .field:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextCell") as? InputTextCell else {
                fatalError("Must be provide a InputTextCell")
            }
            cell.setup()
            return cell
        default:
            break
        }
        return UITableViewCell()
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
