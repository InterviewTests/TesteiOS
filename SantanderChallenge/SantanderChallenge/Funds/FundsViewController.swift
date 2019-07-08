//
// FundsViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit
import SafariServices

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
        view.superview?.layoutIfNeeded()

        
        setupTableView()
        setupInteractor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.setNeedsUpdateConstraints()
        interactor?.fetchFunds()
    }
    
    private func setupTableView() {
        // Register cells
        tableView.registerCellsNib(cellsClass: [
            FundTitleTableViewCell.self,
            FundNameTableViewCell.self,
            FundDefinitionTableViewCell.self,
            FundRiskTableViewCell.self,
            FundInfoTitleTableViewCell.self,
            FundMoreInfoTableViewCell.self,
            SeparatorTableViewCell.self,
            FundInfoTableViewCell.self,
            FundDownInfoTableViewCell.self,
            ActionButtonTableViewCell.self
        ])
        
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
       
        let content = cells[indexPath.row]
        
        switch content {
        case .title:
            return generateTitleCell(for: tableView, with: content)
        case .fundName:
            return generateFundNameCell(for: tableView, with: content)
        case .definition:
            return generateFundDefinitionCell(for: tableView, with: content)
        case .risk:
            return generateFundRiskCell(for: tableView, with: content)
        case .infoTitle:
            return generateFundInfoTitleCell(for: tableView, with: content)
        case .moreInfo:
            return generateFundMoreInfoCell(for: tableView, with: content)
        case .separator:
            return generateSeparatorCell(for: tableView)
        case .info:
            return generateFundInfoCell(for: tableView, with: content)
        case .downInfo:
            return generateFundDownInfoCell(for: tableView, with: content)
        case .actionButton:
            return generateActionButtonCell(for: tableView, with: content)
        }
        
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
    
    func generateFundInfoTitleCell(for tableView: UITableView, with content: FundContentData) -> UITableViewCell {
        
        let cell: FundInfoTitleTableViewCell = tableView.dequeueReusableCell(cellType: FundInfoTitleTableViewCell.self)
        
        if case let FundContentData.infoTitle(title) = content {
            cell.infoTitleLabel.text = title
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
        cell.delegate = self
        
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

extension FundsViewController: FundDownInfoTableViewCellDelegate {
    func didTouchDownload(at cell: FundDownInfoTableViewCell) {
        guard let googleURL = URL(string: "https://google.com") else { return }
        let safari = SFSafariViewController(url: googleURL)
        safari.delegate = self
        self.present(safari, animated: true, completion: nil)
    }
}

extension FundsViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
