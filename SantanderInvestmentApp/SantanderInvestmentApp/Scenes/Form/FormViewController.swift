//
//  MainViewController.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

enum ScreenType {
    case contact
    case investiment
}

protocol MainViewControllerInput: class {
    func displayFunds(viewModel: MainViewModel)
    func displayError(status: ViewStatus<ButtonAction>)
}

protocol MainInfoProtocol {
    func sections() -> [TableSectionable]
    func itemsInfoSections() -> [TableSectionable]
    
    func contactSections() -> [TableSectionable]
    func contactInfoSections() -> [TableSectionable]
}

extension MainInfoProtocol {
    func sections() -> [TableSectionable] {
        var sections: [TableSectionable] = []
        sections.append(contentsOf: itemsInfoSections())
        return sections
    }
    
    func contactSections() -> [TableSectionable] {
        var sections: [TableSectionable] = []
        sections.append(contentsOf: contactInfoSections())
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
    var contactDatasource: TableViewSectionableDataSourceDelegate?
    
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
        self.mainView?.delegate = self
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
        
        contactDatasource = TableViewSectionableDataSourceDelegate(sections: contactInfoSections())
        mainView?.contactView.tableView.delegate = contactDatasource
        mainView?.contactView.tableView.dataSource = contactDatasource
        mainView?.contactView.tableView.reloadData()
        
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
    
    func contactInfoSections() -> [TableSectionable] {
        let cells = [
            CellModel(id: 1, type: .field, message: "Nome Completo", typefield: .text, hidden: false, topSpacing: 18.0, show: nil, required: true),
            CellModel(id: 2, type: .field, message: "Email", typefield: .email, hidden: false, topSpacing: 18.0, show: nil, required: true),
            CellModel(id: 3, type: .field, message: "Telefone", typefield: .telNumber, hidden: false, topSpacing: 18.0, show: nil, required: true),
            CellModel(id: 4, type: .checkbox, message: "Gostaria de cadastrar meu email", typefield: .text, hidden: false, topSpacing: 18.0, show: nil, required: true),
            CellModel(id: 5, type: .send, message: "Enviar", typefield: .text, hidden: false, topSpacing: 18.0, show: nil, required: true)
        ]
        if let tableView = mainView?.contactView.tableView {
            let cellsBuilder = FormCellBuilder(items: cells, tableView: tableView)
            cellsBuilder.registerCell()
            cellsBuilder.delegate = self
            return [cellsBuilder.build()]
        }
        fatalError("Must implement a tableView for the builder")
    }
}

extension MainViewController: MainCellBuilderProtocol {
    func didClickOnButton() {
        router?.routerToSafari()
    }
}

extension MainViewController: FormCellBuilderProtocol {
    func didClickButton() {
        self.mainView?.contactView.setupStatus(status: .success)
    }
}

extension MainViewController: MainViewProtocol {
    func didChangeTab(type: ScreenType) {
        if type == .contact {
            self.title = "Contato"
        } else {
            self.title = "Investimento"
        }
    }
}
