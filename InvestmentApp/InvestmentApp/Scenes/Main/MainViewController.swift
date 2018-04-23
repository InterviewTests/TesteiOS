//
//  MainViewController.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var mainView: MainView?
    var cellsBuilder: FormCellBuilder?
    var interactor: MainInteractor?
    
    var datasource: TableViewSectionableDataSourceDelegate?
    
    init(interactor: MainInteractor = MainInteractor(), presenter: MainPresenter = MainPresenter()) {
        super.init(nibName: nil, bundle: nil)
        
        let viewController = self
        self.interactor = interactor
        let presenter = presenter
        //let router = ListOrdersRouter()
        //viewController.interactor = interactor
        //viewController.router = router
        //interactor.presenter = presenter
        //presenter.viewController = viewController
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
        self.view = MainView()
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
//        ProgressView.shared.showProgressView(self.view)
//        interactor?.fetchForm()
    }
}
