//
//  MainViewController.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

protocol MainViewControllerInput: class {
    func displayFunds(viewModel: MainViewModel)
    func displayError(status: ViewStatus<ButtonAction>)
}

class MainViewController: UIViewController {
    var mainView: MainView?
    var cellsBuilder: FormCellBuilder?
    var interactor: MainInteractor?
    
    var datasource: TableViewSectionableDataSourceDelegate?
    
    init(interactor: MainInteractor = MainInteractor(), presenter: MainPresenter = MainPresenter()) {
        self.mainView = MainView()
        super.init(nibName: nil, bundle: nil)
        
        let viewController = self
        self.interactor = interactor
        let presenter = presenter
        //let router = ListOrdersRouter()
        viewController.interactor = interactor
        //viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        //router.viewController = viewController
        //router.dataStore = interactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        mainView = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchForm()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        self.view = self.mainView
    }
    
    private func setupNavigationController() {
        self.title = "Investimento"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setupDatasource() {
//        self.view = mainView
//        cellsBuilder?.registerCell()
//        datasource = TableViewSectionableDataSourceDelegate(sections: sections())
//        datasource?.delegate = self
//        mainView?.tableView.delegate = datasource
//        mainView?.tableView.dataSource = datasource
//        mainView?.tableView.reloadData()
    }
    
    func fetchForm() {
        ProgressView.shared.showProgressView(self.view)
        interactor?.fetchFund()
    }
}

extension MainViewController: MainViewControllerInput {
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
    
    func displayFunds(viewModel: MainViewModel) {
        ProgressView.shared.hideProgressView()
        self.mainView?.setup(littleTitle: viewModel.fund.title, title: viewModel.fund.fundName, descriptionTitle: viewModel.fund.whatIs, descriptionText: viewModel.fund.definition, risk: viewModel.fund.riskTitle, riskSelected: viewModel.fund.risk, info: viewModel.fund.infoTitle)
//        guard let tableView = self.mainView?.tableView else {
//            fatalError("Cells and tableView must be provided")
//        }
//        self.cellsBuilder = FormCellBuilder(items: viewModel.cells, tableView: tableView)
//        self.cellsBuilder?.delegate = self
//        self.setupDatasource()
    }
}
