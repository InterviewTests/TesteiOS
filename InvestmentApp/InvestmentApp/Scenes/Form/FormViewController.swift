//
//  FormViewController.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

protocol FormViewControllerInput: class {
    func displayForm(viewModel: FormViewModel)
    func displayError(status: ViewStatus<ButtonAction>)
}

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
    var cellsBuilder: FormCellBuilder?
    var interactor: FormInteractor?
    
    var datasource: TableViewSectionableDataSourceDelegate?
    
    init(mainView: FormView = FormView()) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        mainView = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setup()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchForm()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    private func setupNavigationController() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setup() {
        let viewController = self
        interactor = FormInteractor()
        let presenter = FormPresenter()
        //let router = ListOrdersRouter()
        //viewController.interactor = interactor
        //viewController.router = router
        interactor?.presenter = presenter
        presenter.viewController = viewController
        //router.viewController = viewController
        //router.dataStore = interactor
    }
    
    private func setupDatasource() {
        cellsBuilder?.registerCell()
        datasource = TableViewSectionableDataSourceDelegate(sections: sections())
        datasource?.delegate = self
        mainView?.tableView.delegate = datasource
        mainView?.tableView.dataSource = datasource
        mainView?.tableView.reloadData()
    }
    
    func fetchForm() {
        ProgressView.shared.showProgressView(self.view)
        interactor?.fetchForm()
    }
}

extension FormViewController: FormViewControllerInput {
    func displayError(status: ViewStatus<ButtonAction>) {
        DispatchQueue.main.async {
            ProgressView.shared.hideProgressView()
            switch status {
            case .internetError(_):
                self.view = ErrorView(errorMessage: "Você näo está conectado a internet, por favor conecte-se e tente novamente mais tarde.", buttonAction: {
                        self.fetchForm()
                    })
            default:
                self.view = ErrorView(errorMessage: "Ocorreu um erro na sua requisição, por favor tente novamente.", buttonAction: {
                    self.fetchForm()
                })
            }
        }
    }
    
    func displayForm(viewModel: FormViewModel) {
        guard let tableView = self.mainView?.tableView else {
            fatalError("Cells and tableView must be provided")
        }
        self.cellsBuilder = FormCellBuilder(items: viewModel.cells, tableView: tableView)
        setupDatasource()
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
