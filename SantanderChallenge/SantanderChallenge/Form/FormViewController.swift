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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupInteractor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        startLoading()
        interactor?.fetchForm()
    }
    
    private func setupTableView() {
        // Register cells
        tableView.registerCellsNib(cellsClass:
            [TitleTableViewCell.self,
             InputTextTableViewCell.self,
             InputEmailTableViewCell.self,
             InputPhoneTableViewCell.self,
             CheckboxTableViewCell.self,
             ActionButtonTableViewCell.self
            ]
        )
        
        tableView.tableFooterView = UIViewController.blankView
    }
    
    private func setupInteractor() {
        let presenter = FormPresenter(view: self)
        interactor = FormInteractor(presenter: presenter)
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
        case .email:
            cell = tableView.dequeueReusableCell(cellType: InputEmailTableViewCell.self)
        case .phone:
            cell = tableView.dequeueReusableCell(cellType: InputPhoneTableViewCell.self)
        default:
            return UITableViewCell()
        }
        
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
        case .unselected:
            targetFormCell.hidden = true
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
            valid = validate(name: text, cell: cell)
        case is InputPhoneTableViewCell:
            valid = validate(phone: text, cell: cell)
        case is InputEmailTableViewCell:
            valid = validate(email: text, cell: cell)
        default:
            return
        }
        cell.setValidIndicatorColor(valid: valid)
    }
    
    private func validate(name: String, cell: InputTextFieldTableViewCell) -> Bool {
        return interactor?.isValid(name: name) == true
    }
    
    private func validate(phone: String, cell: InputTextFieldTableViewCell) -> Bool {
        return interactor?.isValid(phone: phone) == true
    }
    
    private func validate(email: String, cell: InputTextFieldTableViewCell) -> Bool {
        return interactor?.isValid(email: email) == true
    }
}

extension FormViewController: ActionButtonTableViewCellDelegate {
    func didTouchActionButton(atCell cell: ActionButtonTableViewCell) {
        performSegue(withIdentifier: "showSuccess", sender: nil)
    }
}
