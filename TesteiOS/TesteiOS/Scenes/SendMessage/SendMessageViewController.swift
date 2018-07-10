//
//  SendMessageViewController.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

protocol SendMessageDisplayLogic: class {
    func display(viewModel: SendMessage.Something.ViewModel)
    func displayError()
}

typealias FormItem = SendMessage.FormItem

class SendMessageViewController: UIViewController, SendMessageDisplayLogic {
    var interactor: SendMessageBusinessLogic?
    
    @IBOutlet weak var formTableView: UITableView!
    // MARK: Object lifecycle
    
    var models = [FormItem]()
  
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
        let interactor = SendMessageInteractor()
        let presenter = SendMessagePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
  
  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        requestForm()
    }
    
    func setupTableView() {
        let fieldCellNib = UINib(nibName: "FieldTableViewCell", bundle: nil)
        let textCellNib = UINib(nibName: "TextTableViewCell", bundle: nil)
        let checkBoxNib = UINib(nibName: "CheckboxTableViewCell", bundle: nil)
        let sendNib = UINib(nibName: "SendTableViewCell", bundle: nil)
        
        formTableView.register(fieldCellNib, forCellReuseIdentifier: Constants.kFieldCellIdentifier)
        formTableView.register(textCellNib, forCellReuseIdentifier: Constants.kTextCellIdentifier)
        formTableView.register(checkBoxNib, forCellReuseIdentifier: Constants.kCheckboxCellIdentifier)
        formTableView.register(sendNib, forCellReuseIdentifier: Constants.kSendCellIdentifier)
    }
    
    func requestForm() {
        let request = SendMessage.Something.Request()
        interactor?.request(request: request)
    }
  
    func display(viewModel: SendMessage.Something.ViewModel) {
        models = viewModel.items
        formTableView.reloadData()
    }
}

extension SendMessageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: models[indexPath.row].type.identifier) as? FormTableViewCell
        cell?.configure(with: models[indexPath.row])
        return cell as? UITableViewCell ?? UITableViewCell()
    }
}




