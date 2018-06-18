//
//  FundsViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//

import UIKit
import SafariServices

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
  
    // MARK: Request
  
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

// MARK: - UITableView data sources

extension FundsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard funds != nil else {
            return 0
        }
        
        return FundsFactory.numberOfRows(section: section, fund: self.funds!)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FundsFactory.configureCell(fund: funds!, tableView: tableView, indexPath: indexPath, delegate: self)
        return cell
    }
}

// MARK: - Download delegate

extension FundsViewController: DownloadDelegate {
    func download() {
        let url = URL(string: "http://www.google.com.br")
        let safari = SFSafariViewController(url: url!)
        self.present(safari, animated: true, completion: nil)
    }
}
