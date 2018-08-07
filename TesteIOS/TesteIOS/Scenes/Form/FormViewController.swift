//
//  FormViewController.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FormDisplayLogic: class {
    func displayFetchedCells(viewModel: Form.FetchCells.ViewModel)
    func displayError(error: Error)
}

class FormViewController: UIViewController, FormDisplayLogic {
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifiers: [CellType: String] = [
        CellType.Field :"FieldCell",
        CellType.Text: "TextCell",
        CellType.Checkbox: "CheckboxCell",
        CellType.Send: "SendCell"
    ]
    
    var interactor: FormBusinessLogic?
    var router: (NSObjectProtocol & FormRoutingLogic & FormDataPassing)?
    var displayedCells: [Form.FetchCells.ViewModel.DisplayedCell] = []
    
    //    MARK: - Object Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    //    MARK: - Setup
    func setup(){
        let viewController = self
        let interactor = FormInteractor()
        let presenter = FormPresenter()
        let router = FormRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        fetchCells()
    }
    
    //    MARK: - View Config
    func configTableView(){
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "FormFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "FieldCell")
        tableView.register(UINib(nibName: "FormTextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextCell")
        tableView.register(UINib(nibName: "FormCheckboxTableViewCell", bundle: nil), forCellReuseIdentifier: "CheckboxCell")
        tableView.register(UINib(nibName: "FormSendTableViewCell", bundle: nil), forCellReuseIdentifier: "SendCell")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        tableView.addGestureRecognizer(tapGesture)
    }
    
    //    MARK: - Fetch
    func fetchCells(){
        let request = Form.FetchCells.Request()
        interactor?.fetchCells(request: request)
    }
    
    func displayError(error: Error) {
        
    }
    
    func displayFetchedCells(viewModel: Form.FetchCells.ViewModel) {
        displayedCells = viewModel.displayedCells
        tableView.reloadData()
    }
    
    //    MARK: - Others
    @objc func tableViewTapped(){
        view.endEditing(true)
    }
}

extension FormViewController: FormDefaultCellDelegate {
    func sendButtonTouched() {
        if let router = router {
            router.routeToShowFundos()
        }
    }
}
