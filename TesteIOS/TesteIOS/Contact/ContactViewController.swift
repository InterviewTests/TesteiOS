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
        self.registerCell()
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
    
    func registerCell() {
        let textFieldNib = UINib(nibName: NibName.textfieldNib, bundle: nil)
        let labelNib = UINib(nibName: NibName.labelNib, bundle: nil)
        let checkButtonNib = UINib(nibName: NibName.checkButtonNib, bundle: nil)
        let buttonNib = UINib(nibName: NibName.buttonNib, bundle: nil)
        
        self.tableView.register(textFieldNib, forCellReuseIdentifier: CellIdentifier.textFieldCell)
        self.tableView.register(buttonNib, forCellReuseIdentifier: CellIdentifier.buttonCell)
        self.tableView.register(labelNib, forCellReuseIdentifier: CellIdentifier.labelCell)
        self.tableView.register(checkButtonNib, forCellReuseIdentifier: CellIdentifier.checkButtonCell)
    }
}

extension ContactViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[indexPath.row]
        switch cell.type! {
        case .field:
            let textCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.textFieldCell, for: indexPath) as! TextFieldTableViewCell
            textCell.configureLabel(formCell: cell)
            return textCell
        case .text:
            let labelCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.labelCell, for: indexPath) as! LabelTableViewCell
            return labelCell
        case .checkbox:
            let checkCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.checkButtonCell, for: indexPath) as! CheckButtonTableViewCell
            checkCell.configureCell(formCell: cell)
            return checkCell
        case .send:
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.buttonCell, for: indexPath) as! ButtonTableViewCell
            buttonCell.configureCell(formCell: cell)
            return buttonCell
        case .image:
            let imageCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.imageCell, for: indexPath)
            return imageCell
        }
    }
    
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
