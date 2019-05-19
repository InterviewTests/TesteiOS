//
//  FundsViewController.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class FundsViewController: UIViewController {
    
    public var dataSource: TableViewDataSource?
    public weak var coordinator: (Funding & Contacting)?
    
    private var fundsView: FundsView
    
    init() {
        self.fundsView = FundsView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        super.loadView()
        self.view = fundsView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = "Investimento"
        buildTableView()
    }
    
}

extension FundsViewController: TableViewing {
    
    public func buildTableView() {
        let sections = buildTableViewSections()
        dataSource = TableViewDataSource(sections: sections,
                                         tableView: fundsView.tableView)
        
        fundsView.tableView.dataSource = dataSource
        fundsView.tableView.delegate = dataSource
        fundsView.tableView.reloadData()
    }
    
    public func buildTableViewSections() -> [TableViewSectionBuilder] {
        var sections = [TableViewSectionBuilder]()
        sections.append(TableViewStaticSection(cellBuilders: buildTableViewCellBuilders()))
        return sections
    }
    
    public func buildTableViewCellBuilders() -> [TableViewCellBuilder] {
        var builders = [TableViewCellBuilder]()
        
        let headerCellBuilder =
            FundsHeaderViewCellBuilder(configuration:
                .init(title: "Fundos de investimento",
                      subtitle: "Vinci Valorem FI Multimercado"))
        
        builders.append(headerCellBuilder)
        
        return builders
    }
    
}
