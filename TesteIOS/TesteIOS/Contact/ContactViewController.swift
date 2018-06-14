//
//  ContactViewController.swift
//  TesteIOS
//
//  Created by Sidney Silva on 11/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
//


import UIKit

protocol ContactDisplayLogic: class {
    func display(viewModel: Contact.Fetch.ViewModel)
}

class ContactViewController: UITableViewController, ContactDisplayLogic {
    var interactor: ContactBusinessLogic?
    var router: (NSObjectProtocol & ContactRoutingLogic)?
    var cells = [Cell]()
  
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
        let interactor = ContactInteractor()
        let presenter = ContactPresenter()
        let router = ContactRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
  
      // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        FormFactory.registerCell(tableView: self.tableView)
        self.fetch()
    }
  
    func fetch() {
        let request = Contact.Fetch.Request(url: Url.formUrl)
        interactor?.fetch(request: request)
    }
  
    func display(viewModel: Contact.Fetch.ViewModel) {
        guard viewModel.error == nil, viewModel.cells != nil else {
            AlertViewUtil.createAlertView(viewController: self, message: ErrorMessenger.connectError) {
                self.fetch()
            }
            return
        }
        self.cells = viewModel.cells!
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableView data sources
extension ContactViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[indexPath.row]
        return FormFactory.configureTableViewCell(tableView: tableView, indexPath: indexPath, cell: cell, delegate: self)
    }
}

//MARK: - UITableView delegates

extension ContactViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = cells[indexPath.row]
        if cell.hidden! {
            return 0
        }
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension ContactViewController: CheckButtonDelegate {
    func checkButtonIsClicked(formCell: Cell) {
        guard formCell.show != nil else {return}
        if let indexCell = cells.index(where: {$0.id == formCell.show!}) {
            cells[indexCell].hidden = !cells[indexCell].hidden!
            self.tableView.reloadData()
        }
    }
}

extension ContactViewController: SendButtonDelegate {
    func validateFields() {
        router?.prepareToRouter(cells: cells)
    }
    
    
}
