//
//  SantanderBaseFormViewController.swift
//  Santander
//
//  Created by Orlando Amorim on 11/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation
import Eureka

class SantanderBaseFormViewController: FormViewController {
    
    init() {
        super.init(style: .grouped)
    }
    
    @available(*, unavailable)
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    
    // MARK: - Fix animations
    override func insertAnimation(forRows rows: [BaseRow]) -> UITableView.RowAnimation { return .fade }
    override func deleteAnimation(forRows rows: [BaseRow]) -> UITableView.RowAnimation { return .fade }
    override func reloadAnimation(oldRows: [BaseRow], newRows: [BaseRow]) -> UITableView.RowAnimation { return .fade }
    override func insertAnimation(forSections sections: [Section]) -> UITableView.RowAnimation { return .fade }
    override func deleteAnimation(forSections sections: [Section]) -> UITableView.RowAnimation { return .fade }
    override func reloadAnimation(oldSections: [Section], newSections: [Section]) -> UITableView.RowAnimation { return .fade }
}

extension SantanderBaseFormViewController {
    
    @discardableResult
    func makeSection(with tag: String? = nil, header: SectionHeaderFooterRenderable? = nil, footer: SectionHeaderFooterRenderable? = nil, rows: [BaseRow]) -> Section {
        let section = Section()
        section.tag = tag
        section.header = header?.viewForItem()
        section.footer = footer?.viewForItem()
        section.append(contentsOf: rows)
        form.append(section)
        return section
    }
}
