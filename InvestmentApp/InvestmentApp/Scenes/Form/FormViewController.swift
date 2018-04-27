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
    var router: FormRouterLogic?
    
    var datasource: TableViewSectionableDataSourceDelegate?
    
    init(interactor: FormInteractor = FormInteractor(), presenter: FormPresenter = FormPresenter(), router: FormRouter = FormRouter()) {
        self.mainView = FormView()
        super.init(nibName: nil, bundle: nil)
        
        let viewController = self
        self.interactor = interactor
        let presenter = presenter
        self.router = router
        router.viewController = viewController
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    required init?(coder aDecoder: NSCoder) {
        mainView = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchForm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    private func setupNavigationController() {
        self.navigationItem.title = " "
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupDatasource() {
        self.view = mainView
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
    
    func displayForm(viewModel: FormViewModel) {
        ProgressView.shared.hideProgressView()
        guard let tableView = self.mainView?.tableView else {
            fatalError("Cells and tableView must be provided")
        }
        self.cellsBuilder = FormCellBuilder(items: viewModel.cells, tableView: tableView)
        self.cellsBuilder?.delegate = self
        self.setupDatasource()
    }
}

extension FormViewController: TableViewSectionableDelegate {
    func didSelectRowAt(indexPath: IndexPath) {
        
    }
}

extension FormViewController: FormCellBuilderProtocol {
    func didClickButton() {
        router?.routerToMain()
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
