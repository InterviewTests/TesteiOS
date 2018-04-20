//
//  FormViewController.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

protocol FormInfoProtocol {
    func sections() -> [TableSectionable]
    func itemsInfoSections() -> [TableSectionable]
}

extension FormInfoProtocol {
    func sections() -> [TableSectionable] {
        var sections: [TableSectionable] = []
        sections.append(contentsOf: itemsInfoSections())
        return sections
    }
}

class FormViewController: UIViewController {
    var mainView: FormView?
    var cells: [CellModel]?
    var cellsBuilder: FormCellBuilder?
    
    var datasource: TableViewSectionableDataSourceDelegate?
    
    init(mainView: FormView = FormView()) {
        self.mainView = mainView
        self.cells = CellModel.mockCells()
        
        guard let cells = self.cells, let tableView = self.mainView?.tableView else {
            fatalError("Cells and tableView must be provided")
        }
        
        self.cellsBuilder = FormCellBuilder(items: cells, tableView: tableView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        mainView = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatasource()
        setupNavigationController()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    func setupNavigationController() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupDatasource() {
        cellsBuilder?.registerCell()
        datasource = TableViewSectionableDataSourceDelegate(sections: sections())
        datasource?.delegate = self
        mainView?.tableView.delegate = datasource
        mainView?.tableView.dataSource = datasource
        mainView?.tableView.reloadData()
    }
}

extension FormViewController: TableViewSectionableDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        
    }
}


extension FormViewController: FormInfoProtocol {
    func itemsInfoSections() -> [TableSectionable] {
        guard let cellsBuilder = self.cellsBuilder else {
            fatalError("CellsBuilder must be provided")
        }
        return [cellsBuilder.build()]
    }
    
}
