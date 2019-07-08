//
// FormViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

protocol FormPresentableProtocol: AnyObject {
    func displayForm(_ cells: [FormCell])
    func displayError(_ error: String)
}

class FormViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var interactor: FormInteractor?
    fileprivate var cells: [FormCell] = []
    fileprivate var visibleCells: [FormCell] {
        return cells.compactMap { cell -> FormCell? in
            if cell.hidden == false {
                return cell
            }
            return nil
        }
    }
    
    fileprivate var contactData: ContactData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupInteractor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        contactData = ContactData(name: "", phone: "")
        
        startLoading()
        interactor?.fetchForm()
    }
    
    private func setupTableView() {
        
        tableView.registerCellsNib(cellsClass: [
            TitleTableViewCell.self,
            InputTextTableViewCell.self,
            InputEmailTableViewCell.self,
            InputPhoneTableViewCell.self,
            CheckboxTableViewCell.self,
            ActionButtonTableViewCell.self
            ])
        
        tableView.tableFooterView = UIViewController.blankView
    }
    
    private func setupInteractor() {
        let presenter = FormPresenter(view: self)
        interactor = FormInteractor(presenter: presenter)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let destination = segue.destination as? SuccessViewController
        destination?.willDismiss = willDismissSuccessController
    }
    
    private func willDismissSuccessController() {
        contactData = ContactData(name: "", phone: "")
        tableView.reloadData()
    }
}


extension FormViewController: FormPresentableProtocol {
    func displayForm(_ cells: [FormCell]) {
        defer {
            stopLoading()
        }
        
        self.cells = cells
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        stopLoading()
        let alert = UIAlertController(title: "🤨", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}


extension FormViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return visibleCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = visibleCells[indexPath.section]
        guard let type = cell.type else { return UITableViewCell() }
        
        switch type {
        case .text:
            return generateTextCell(for: tableView, with: cell)
        case .field:
            return generateFieldCell(for: tableView, with: cell)
        case .checkbox:
            return generateCheckboxCell(for: tableView, with: cell)
        case .send:
            return generateActionButtonCell(for: tableView, with: cell)
        default:
            return UITableViewCell()
        }
    }
}

extension FormViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(visibleCells[section].topSpacing ?? 0.0)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIViewController.blankView
    }
}

// MARK: - Cells Generation
fileprivate extension FormViewController {
    func generateTextCell(for tableView: UITableView, with cellData: FormCell) -> UITableViewCell {
        guard let cell: TitleTableViewCell = tableView.dequeueReusableCell(cellType: TitleTableViewCell.self) else { return UITableViewCell()
        }
        
        cell.titleLabel.text = cellData.message

        return cell
    }
    
    func generateFieldCell(for tableView: UITableView, with cellData: FormCell) -> UITableViewCell {
        
        guard let fieldType = cellData.fieldType else { return UITableViewCell() }
        let cell: InputTextFieldTableViewCell?
        
        switch fieldType {
        case .text:
            cell = tableView.dequeueReusableCell(cellType: InputTextTableViewCell.self)
            cell?.textField.text = contactData.name
        case .email:
            cell = tableView.dequeueReusableCell(cellType: InputEmailTableViewCell.self)
            cell?.textField.text = contactData.email
        case .phone:
            cell = tableView.dequeueReusableCell(cellType: InputPhoneTableViewCell.self)
            cell?.textField.text = contactData.phone
        default:
            return UITableViewCell()
        }
        
        cell?.setValidIndicatorColor(status: .notChecked)
        cell?.set(placeholder: cellData.message)
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    func generateCheckboxCell(for tableView: UITableView, with cellData: FormCell) -> UITableViewCell {
        guard let cell: CheckboxTableViewCell = tableView.dequeueReusableCell(cellType: CheckboxTableViewCell.self) else { return UITableViewCell()
        }
        cell.cellData = cellData
        cell.delegate = self
        
        // Current status
        guard let targetId = cell.cellData?.fieldToPresent,
            let index = formCellIndex(withId: targetId) else { return UITableViewCell() }
        let targetFormCell = cells[index]
        
        if targetFormCell.hidden == true {
            cell.checkBoxStatus = .unselected
        } else {
            cell.checkBoxStatus = .selected
        }
        
        return cell
    }
    
    func generateActionButtonCell(for tableView: UITableView, with cellData: FormCell) -> UITableViewCell {
        guard let cell: ActionButtonTableViewCell = tableView.dequeueReusableCell(cellType: ActionButtonTableViewCell.self) else { return UITableViewCell()
        }
        
        cell.actionButton.setTitle(cellData.message, for: .normal)
        cell.delegate = self
        return cell
    }
}

extension FormViewController: CheckBoxTableViewDelegate {
    func checkboxUpdated(status: CheckBoxSelectionStatus, atCell cell: CheckboxTableViewCell) {
        guard let targetId = cell.cellData?.fieldToPresent,
            let index = formCellIndex(withId: targetId) else { return }
        let targetFormCell = cells[index]
        
        switch status {
        case .selected:
            targetFormCell.hidden = false
            contactData.email = ""
        case .unselected:
            targetFormCell.hidden = true
            contactData.email = nil
        }
        tableView.reloadData()
        
    }
    
    private func formCellIndex(withId targetId: Int) -> Int? {
        return cells.firstIndex(where: {
            return $0.id == targetId
        })
    }
}

extension FormViewController: InputTextFieldTableViewCellDelegate {
    func editingChanged(text: String, atCell cell: InputTextFieldTableViewCell) {
        let valid: Bool
        
        switch cell {
        case is InputTextTableViewCell:
            valid = interactor?.isValid(name: text) == true
            contactData.name = text
        case is InputPhoneTableViewCell:
            valid = interactor?.isValid(phone: text) == true
            contactData.phone = text
        case is InputEmailTableViewCell:
            valid = interactor?.isValid(email: text) == true
            contactData.email = text
        default:
            return
        }
        
        if valid {
            cell.setValidIndicatorColor(status: .valid)
        } else {
            cell.setValidIndicatorColor(status: .invalid)
        }
    }
}

extension FormViewController: ActionButtonTableViewCellDelegate {
    func didTouchActionButton(atCell cell: ActionButtonTableViewCell) {
        
        guard let result = interactor?.isContactDataValid(contactData) else { return }
        
        switch result {
        case .success:
            performSegue(withIdentifier: "showSuccess", sender: nil)
        case .failure(let error):
            displayError(error.detail)    
        }
    }
}
