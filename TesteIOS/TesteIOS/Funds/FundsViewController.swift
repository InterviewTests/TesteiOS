//
//  FundsViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//

import UIKit

protocol FundsDisplayLogic: class {
  func display(viewModel: FundsModel.Fetch.ViewModel)
}

class FundsViewController: UITableViewController, FundsDisplayLogic {
    
    var interactor: FundsBusinessLogic?
    var router: (NSObjectProtocol & FundsRoutingLogic & FundsDataPassing)?
    var funds: Funds?

    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
  // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = FundsInteractor()
        let presenter = FundsPresenter()
        let router = FundsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
  
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
  
    // MARK: Do something
  
    func fetch() {
        let request = FundsModel.Fetch.Request(url: Url.fundsUrl)
        interactor?.fetch(request: request)
    }
  
    func display(viewModel: FundsModel.Fetch.ViewModel) {
        guard viewModel.error == nil, viewModel.screen != nil else {
            AlertViewUtil.createAlertView(viewController: self, message: ErrorMessenger.connectError) {
                self.fetch()
            }
            return
        }
        self.funds = viewModel.screen!
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
