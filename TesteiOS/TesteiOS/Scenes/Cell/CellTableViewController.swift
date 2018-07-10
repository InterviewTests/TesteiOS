//
//  CellTableViewController.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

protocol CellsDisplayLogic: class {
    func displayFetchedCells(viewModel: Cells.FetchCells.ViewModel)
}

class CellTableViewController: UITableViewController, CellsDisplayLogic, FormTableViewCellDelegate, SuccessBackgroundViewDelegate {
    
    var validForm: Bool = false
    var interactor: CellsBusinessLogic?
    var displayedCells: [Cells.FetchCells.ViewModel.DisplayedCell] = []
    
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
        let interactor = CellsInteractor()
        let presenter = CellsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: - View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Contato"
        self.tabBarController?.navigationItem.rightBarButtonItems = []
        self.tabBarController?.setSelectionIndicatorColor(color: UIColor.selectedRed)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchCells()
    }
    
    // MARK: - Fetch cells
    
    func fetchCells() {
        guard !self.validForm else {
            return
        }
        let request = Cells.FetchCells.Request()
        interactor?.fetchCells(request: request)
    }
    
    func displayFetchedCells(viewModel: Cells.FetchCells.ViewModel) {
        displayedCells = viewModel.displayedCells
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        tableView.setSucessoView(self.validForm, delegate: self)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedCells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedCell = displayedCells[indexPath.row]
        var reuseIdentifier: String = "TextTableViewCell"

        switch displayedCell.type {
        case Cell.CellType.field.rawValue:
            reuseIdentifier = "FieldTableViewCell"
        case Cell.CellType.text.rawValue:
            reuseIdentifier = "TextTableViewCell"
        case Cell.CellType.checkbox.rawValue:
            reuseIdentifier = "CheckboxTableViewCell"
        case Cell.CellType.button.rawValue:
            reuseIdentifier = "ButtonTableViewCell"
        default:
            ()
        }

        let cell: FormTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FormTableViewCell
        cell.update(self, cell: displayedCell)
        return cell
    }
    
    func showCell (id: Int) {
        for index in 0..<displayedCells.count where displayedCells[index].id == id {
            displayedCells[index].hidden = !displayedCells[index].hidden
            break
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return displayedCells[indexPath.row].hidden ? 0.0 : UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let formCell: FormTableViewCell = tableView.cellForRow(at: indexPath) as? FormTableViewCell {
            if let cellModel: Cells.FetchCells.ViewModel.DisplayedCell = formCell.cell {
                if let id: Int = cellModel.show {
                    self.showCell(id: id)
                }
                
                if cellModel.type == Cell.CellType.checkbox.rawValue {
                    formCell.toggleCheck()
                }
            }
        }
        tableView.reloadData()
    }
    
    
    // MARK: - FormTableViewCellDelegate
    
    func buttonClicked() {
        if self.validateForm() {
            self.validForm = true
            displayedCells.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func validateForm() -> Bool {
        var formValidInput: Bool = true
        for index in 0..<displayedCells.count {
            if let formCell: FormTableViewCell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? FormTableViewCell {
                let formCellValidInput = formCell.validateInput()
                formValidInput = formValidInput && formCellValidInput
            }
        }
        return formValidInput
    }
    
    // MARK: - SuccessBackgroundViewDelegate
    
    func buttonDismissClicked() {
        self.validForm = false
        self.fetchCells()
    }
}
