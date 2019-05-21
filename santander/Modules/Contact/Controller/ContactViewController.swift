//
//  ContactViewController.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    public weak var delegate: (Contacting)?
    
    private var contactView: ContactView
    private var service: FormServiceProtocol
    private var response: FormResponse?
    private var dataSource: TableViewDataSource?
    
    init(service: FormServiceProtocol = FormService()) {
        self.service = service
        self.contactView = ContactView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contactView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contato"
        self.getForm()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func getForm() {
        
        service.get { [weak self] result in
            guard let sSelf = self else { return }
            sSelf.response = result
            sSelf.buildTableView()
        }
        
    }
    
}

extension ContactViewController: TableViewing {
    
    func buildTableView() {
        let sections = buildTableViewSections()
        dataSource = TableViewDataSource(sections: sections,
                                         tableView: contactView.tableView)
        
        contactView.tableView.dataSource = dataSource
        contactView.tableView.delegate = dataSource
        contactView.tableView.reloadData()
    }
    
    private func buildTableViewSections() -> [TableViewSectionBuilder] {
        var sections = [TableViewSectionBuilder]()
        sections.append(TableViewStaticSection(cellBuilders: buildFormCellBuilders()))
        return sections
    }
    
    private func buildFormCellBuilders() -> [TableViewCellBuilder] {
        var builders = [TableViewCellBuilder]()
        
        guard let cells = response?.cells else {
            return builders
        }
        
        for cell in cells {
            if !cell.hidden {
                let topSpacing = CGFloat(cell.topSpacing)
                builders.append(SeparatorInlineCellBuilder(spaced: topSpacing))
                builders.append(DynamicCellBuilder(response: cell))
            }
        }
        
        return builders
    }
    
}
