//
//  MainCellBuilder.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

enum BuilderType {
    case yield
    case details
    case detailWithDownload
}

protocol MainCellBuilderProtocol: class {
    func didClickOnButton()
}

class MainCellBuilder: TableViewCellBuilder {
    let tableView: UITableView
    let infoDetailItems: [InfoDetailModel]
    let items: [InfoModel]
    let type: BuilderType
    
    weak var delegate: MainCellBuilderProtocol?
    
    init(infoDetailItems: [InfoDetailModel], items: [InfoModel], type: BuilderType, tableView: UITableView) {
        self.infoDetailItems = infoDetailItems
        self.items = items
        self.type = type
        self.tableView = tableView
    }
    
    func registerCell() {
        tableView.register(FirstYieldCell.self, forCellReuseIdentifier: "FirstYieldCell")
        tableView.register(YieldCell.self, forCellReuseIdentifier: "YieldCell")
        tableView.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
    }
    
    func build() -> TableSectionable {
        if type == .yield {
            return SectionWithFooter(cellBuilder: self, in: tableView)
        }
        return BaseSection(cellBuilder: self, in: tableView)
    }
    
    func estimatedCellHeight(indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        switch type {
        case .yield:
            if indexPath.row == 0 {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstYieldCell") as? FirstYieldCell else {
                    fatalError("Must be provide a FirstYieldCell")
                }
                cell.setup()
                return cell
            } else {
                let item = infoDetailItems[indexPath.row - 1]
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "YieldCell") as? YieldCell else {
                    fatalError("Must be provide a YieldCell")
                }
                cell.setup(title: item.title ?? "", fundo: item.fund, CDI: item.CDI)
                return cell
            }
        case .details:
            let item = items[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as? DescriptionCell else {
                fatalError("Must be provide a DescriptionCell")
            }
            cell.setup(title: item.name, value: item.data ?? "")
            return cell
        case .detailWithDownload:
            let item = items[indexPath.row]
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as? DescriptionCell else {
                fatalError("Must be provide a DescriptionCell")
            }
            cell.setup(title: item.name, value: item.data ?? "", withDownloadButton: true, buttonAction: {
                self.delegate?.didClickOnButton()
            })
            return cell
        }
    }
    
    func numberOfItems() -> Int {
        if type == .yield {
            return infoDetailItems.count + 1
        }
        return items.count
    }
    
    func reuseIdentifier() -> String {
        return ""
    }
    
    func didSelectItemAt(indexPath: IndexPath) {

    }
}

