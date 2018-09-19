//
//  FormCellBuilder.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

protocol FormCellBuilderProtocol: class {
    func didClickButton()
}

class FormCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    let items: [CellModel]
    weak var delegate: FormCellBuilderProtocol?
    
    init(items: [CellModel], tableView: UITableView) {
        self.items = items
        self.tableView = tableView
    }
    
    func registerCell() {
        tableView.register(InputTextCell.self, forCellReuseIdentifier: "InputTextCell")
        tableView.register(TextCell.self, forCellReuseIdentifier: "TextCell")
        tableView.register(CheckboxCell.self, forCellReuseIdentifier: "CheckboxCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "ButtonCell")
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
            cell.setup(title: item.message, topSpacing: CGFloat(item.topSpacing))
            return cell
        case .field:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InputTextCell") as? InputTextCell else {
                fatalError("Must be provide a InputTextCell")
            }
            
            var type = TextFieldType.text
            
            if let typeField = item.typefield {
                switch typeField {
                case .telNumber:
                    type = .telephone
                case .email:
                    type = .email
                case .text:
                    type = .text
                }
            }
            
            cell.setup(topSpacing: CGFloat(item.topSpacing), title: item.message, textType: type)
            return cell
        case .checkbox:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckboxCell") as? CheckboxCell else {
                fatalError("Must be provide a CheckboxCell")
            }
            cell.setup(title: item.message, topSpacing: CGFloat(item.topSpacing))
            return cell
        case .send:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell") as? ButtonCell else {
                fatalError("Must be provide a ButtonCell")
            }
            cell.setup(title: item.message, topSpacing: CGFloat(item.topSpacing), buttonAction: {
                self.delegate?.didClickButton()
            })
            
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
        
    }
}
