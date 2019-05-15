//
//  FormViewController.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 14/05/19.
//  Copyright (c) 2019 Matheus Ribeiro. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FormDisplayLogic: class {
    func displaySomething(viewModel: Form.Something.ViewModel)
    func displayFormCells(viewModel: Form.GetFormCells.ViewModel)
    func displayError(viewModel: Form.FormError.ViewModel)
    func displayFieldValidation(viewModel: Form.FieldValidation.ViewModel)
}

class FormViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var displayedFormCells: [Form.GetFormCells.ViewModel.DisplayViewModel] = []
    
    var interactor: FormBusinessLogic?
    var router: (NSObjectProtocol & FormRoutingLogic & FormDataPassing)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    override func viewDidLoad() {
    super.viewDidLoad()
        
        setupTableView()
        requestData()
    }
    
    private func setupTableView() {
        registerTableViewCells()
    }
    
    private func requestData() {
        let request = Form.GetFormCells.Request()
        interactor?.getFormCells(request: request)
    }
    
    private func registerTableViewCells() {
        let sendCell = UINib(nibName: "SendCell", bundle: nil)
        tableView.register(
            sendCell,
            forCellReuseIdentifier: SendCell.reuseIdentifier
        )
        
        let checkboxCell = UINib(nibName: "CheckboxCell", bundle: nil)
        tableView.register(
            checkboxCell,
            forCellReuseIdentifier: CheckboxCell.reuseIdentifier
        )
        
        let textCell = UINib(nibName: "TextCell", bundle: nil)
        tableView.register(
            textCell,
            forCellReuseIdentifier: TextCell.reuseIdentifier
        )
        
        let fieldCell = UINib(nibName: "FieldCell", bundle: nil)
        tableView.register(
            fieldCell,
            forCellReuseIdentifier: FieldCell.reuseIdentifier
        )
    }

}

extension FormViewController: FormDisplayLogic {
    func displaySomething(viewModel: Form.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    func displayFormCells(viewModel: Form.GetFormCells.ViewModel) {
        displayedFormCells = viewModel.displayedFormCells
        tableView.reloadData()
    }
    
    func displayError(viewModel: Form.FormError.ViewModel) {
        // TODO
        print(viewModel.message)
    }
    
    func displayFieldValidation(viewModel: Form.FieldValidation.ViewModel) {
        if let cell = tableView.cellForRow(at: viewModel.indexPath) as? FieldCell {
            if viewModel.isValid {
                cell.lineView.backgroundColor = UIColor.lightGreenColor
            } else {
                cell.lineView.backgroundColor = UIColor.darkRedColor
            }
        }
    }
}

extension FormViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedFormCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let formCell = displayedFormCells[indexPath.row]
        switch formCell.type {
        case Type.field:
            let cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.reuseIdentifier) as! FieldCell
            cell.viewModel = FieldCell.ViewModel(
                message: formCell.message,
                topSpace: formCell.topSpacing,
                typeField: formCell.typeField,
                indexPath: indexPath
            )
            cell.delegate = self
            return cell
        case Type.text:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.reuseIdentifier) as! TextCell
            cell.viewModel = TextCell.ViewModel(
                message: formCell.message,
                topSpace: formCell.topSpacing
            )
            return cell
        case Type.image:
            return UITableViewCell()
        case Type.checkbox:
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckboxCell.reuseIdentifier) as! CheckboxCell
            cell.viewModel = CheckboxCell.ViewModel(
                message: formCell.message,
                topSpace: formCell.topSpacing
            )
            return cell
        case Type.send:
            let cell = tableView.dequeueReusableCell(withIdentifier: SendCell.reuseIdentifier) as! SendCell
            cell.viewModel = SendCell.ViewModel(
                message: formCell.message,
                topSpace: formCell.topSpacing
            )
            return cell
        }
    }
}

extension FormViewController: FieldCellDelegate {
    func textDidChange(for indexPath: IndexPath, text: String, typeField: TypeField) {
        let request = Form.FieldValidation.Request(text: text, indexPath: indexPath, typeField: typeField)
        interactor?.validateField(request: request)
    }
}
