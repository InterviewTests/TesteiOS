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

class FormViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var interactor: FormInteractor?
    fileprivate var cells: [FormCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupInteractor()
        
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
    }
    
    private func setupInteractor() {
        let presenter = FormPresenter(view: self)
        interactor = FormInteractor(presenter: presenter)
    }
}


extension FormViewController: FormPresentableProtocol {
    func displayForm(_ cells: [FormCell]) {
        self.cells = cells
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        // Present an alert
    }
}


extension FormViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cells[indexPath.section]
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
}

// MARK: - Cells creation
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
        
        return cell ?? UITableViewCell()
    }
    
    func generateCheckboxCell(for tableView: UITableView, with cellData: FormCell) -> UITableViewCell {
        guard let cell: CheckboxTableViewCell = tableView.dequeueReusableCell(cellType: CheckboxTableViewCell.self) else { return UITableViewCell()
        }
        
        cell.checkBoxTextLabel.text = cellData.message
        
        return cell
    }
    
    func generateActionButtonCell(for tableView: UITableView, with cellData: FormCell) -> UITableViewCell {
        guard let cell: ActionButtonTableViewCell = tableView.dequeueReusableCell(cellType: ActionButtonTableViewCell.self) else { return UITableViewCell()
        }
        
        cell.actionButton.setTitle(cellData.message, for: .normal)
        
        return cell
    }
}
