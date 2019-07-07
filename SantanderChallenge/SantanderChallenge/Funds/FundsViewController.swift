//
// FundsViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

protocol FundsPresentableProtocol: AnyObject {
    func displayFunds(_ cells: [FundContentData])
    func displayError(_ error: String)
}

class FundsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var interactor: FundsInteractor?
    fileprivate var cells: [FundContentData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupInteractor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor?.fetchFunds()
    }
    
    private func setupTableView() {
        // Register cells
        
        tableView.tableFooterView = UIViewController.blankView
    }
    
    private func setupInteractor() {
        let presenter = FundsPresenter(view: self)
        interactor = FundsInteractor(presenter: presenter)
    }
}

extension FundsViewController: FundsPresentableProtocol {
    
    func displayFunds(_ cells: [FundContentData]) {
        self.cells = cells
        tableView.reloadData()
    }
    
    func displayError(_ error: String) {
        func displayError(_ error: String) {
            let alert = UIAlertController(title: "🤨", message: error, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
}

extension FundsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
                return cell
            }
            return UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }()
        cell.textLabel?.text = "\(cells[indexPath.row])"
        return cell
    }
    
    
}

extension FundsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Cells Generation
extension FundsViewController {
    func generateTitleCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundTitleTableViewCell = tableView.dequeueReusableCell(cellType: FundTitleTableViewCell.self)
        
        if case let FundContentData.title(fundTitle) = content {
            cell.titleLabel.text = fundTitle
        }
        
        return cell
    }
    
    func generateFundNameCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundNameTableViewCell = tableView.dequeueReusableCell(cellType: FundNameTableViewCell.self)
        
        if case let FundContentData.fundName(name) = content {
            cell.nameLabel.text = name
        }
        
        return cell
    }
    
    func generateFundDefinitionCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundDefinitionTableViewCell = tableView.dequeueReusableCell(cellType: FundDefinitionTableViewCell.self)
        
        if case let FundContentData.definition(title, description) = content {
            cell.topLabel.text = title
            cell.descriptionLabel.text = description
        }
        
        return cell
    }
    
    func generateFundRiskCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundRiskTableViewCell = tableView.dequeueReusableCell(cellType: FundRiskTableViewCell.self)
        
        if case let FundContentData.risk(title, level) = content {
            cell.titleLabel.text = title
            cell.set(level: level)
        }
        
        return cell
    }
    
    func generateFundMoreInfoCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundMoreInfoTableViewCell = tableView.dequeueReusableCell(cellType: FundMoreInfoTableViewCell.self)
        
        if case let FundContentData.moreInfo(moreInfo) = content {
            cell.dataSource = moreInfo
        }
        
        return cell
    }
    
    func generateSeparatorCell(for tableView: UITableView) -> UITableViewCell {
        return tableView.dequeueReusableCell(cellType: SeparatorTableViewCell.self)
    }
    
    func generateFundInfoCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundInfoTableViewCell = tableView.dequeueReusableCell(cellType: FundInfoTableViewCell.self)
        
        if case let FundContentData.info(info) = content {
            cell.leftLabel.text = info.name
            cell.rightLabel.text = info.data
        }
        
        return cell
    }
    
    func generateFundDownInfoCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundDownInfoTableViewCell = tableView.dequeueReusableCell(cellType: FundDownInfoTableViewCell.self)
        
        if case let FundContentData.downInfo(info) = content {
            cell.leftLabel.text = info.name
        }
        
        return cell
    }
    
    func generateActionButtonCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        let cell: ActionButtonTableViewCell = tableView.dequeueReusableCell(cellType: ActionButtonTableViewCell.self)
        
        if case let FundContentData.actionButton(title) = content {
            cell.actionButton.setTitle(title, for: .normal)
        }
        
        return cell
    }
}
