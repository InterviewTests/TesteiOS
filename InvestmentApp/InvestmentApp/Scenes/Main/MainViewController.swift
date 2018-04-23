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

protocol MainInfoProtocol {
    func sections() -> [TableSectionable]
    func itemsInfoSections() -> [TableSectionable]
}

extension MainInfoProtocol {
    func sections() -> [TableSectionable] {
        var sections: [TableSectionable] = []
        sections.append(contentsOf: itemsInfoSections())
        return sections
    }
}

class MainViewController: UIViewController {
    var mainView: MainView?
    var yieldBuilder: MainCellBuilder?
    var descriptionItemsBuilder: MainCellBuilder?
    var descriptionWithDownloadItemsBuilder: MainCellBuilder?
    var interactor: MainInteractor?
    var router: MainRouter?
    
    var datasource: TableViewSectionableDataSourceDelegate?
    
    init(interactor: MainInteractor = MainInteractor(), presenter: MainPresenter = MainPresenter(), router: MainRouter = MainRouter()) {
        self.mainView = MainView()
        super.init(nibName: nil, bundle: nil)
        
        let viewController = self
        self.interactor = interactor
        let presenter = presenter
        self.router = router
        self.router?.viewController = viewController
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
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
        yieldBuilder?.registerCell()
        datasource = TableViewSectionableDataSourceDelegate(sections: sections())
        mainView?.investementView.tableView.delegate = datasource
        mainView?.investementView.tableView.dataSource = datasource
        mainView?.investementView.tableView.reloadData()
        
        mainView?.updateTable()
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
        guard let tableView = self.mainView?.investementView.tableView else {
            fatalError("Cells and tableView must be provided")
        }
        
        self.yieldBuilder = MainCellBuilder(infoDetailItems: viewModel.getMoreInfoDetails(), items: [], type: BuilderType.yield, tableView: tableView)
        self.descriptionItemsBuilder = MainCellBuilder(infoDetailItems: [], items: viewModel.fund.info, type: BuilderType.details, tableView: tableView)
        self.descriptionWithDownloadItemsBuilder = MainCellBuilder(infoDetailItems: [], items: viewModel.fund.downInfo, type: BuilderType.detailWithDownload, tableView: tableView)
        
        self.descriptionWithDownloadItemsBuilder?.delegate = self
        self.setupDatasource()
    }
}

extension MainViewController: FormInfoProtocol {
    func itemsInfoSections() -> [TableSectionable] {
        guard let yieldBuilder = self.yieldBuilder, let descriptionItemsBuilder = self.descriptionItemsBuilder, let descriptionWithDownloadItemsBuilder = self.descriptionWithDownloadItemsBuilder else {
            fatalError("YieldBuilder, DescriptionItemsBuilder amd DescriptionWithDownloadItemsBuilder must be provided")
        }
        return [yieldBuilder.build(), descriptionItemsBuilder.build(), descriptionWithDownloadItemsBuilder.build()]
    }
}

extension MainViewController: MainCellBuilderProtocol {
    func didClickOnButton() {
        router?.routerToSafari()
    }
}
