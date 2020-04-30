//
//  InvestmentFundsViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol InvestmentFundsViewControllerProtocol: BaseViewControllerProtocol {
    var tblFunds: UITableView! {get set}
    
    /// Setups Header for TableView
    /// - Parameters:
    ///   - title: title
    ///   - fundName: fund name
    ///   - whatIs: what is
    ///   - definition: definition
    ///   - riskTitle: risk title
    ///   - investmentValue: investment risk value
    func setupHeader(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, investmentValue: Int)
    
    /// Setups Footer for TableView
    func setupFooter()
    
    /// Requests download
    func downloadRequest()
    
    /// Displays error messages
    /// - Parameter errorMessage: error message
    func showError(errorMessage: String)
}

class InvestmentFundsViewController: BaseViewController, InvestmentFundsViewControllerProtocol {
    
    // MARK: - Properties
    @IBOutlet weak var tblFunds: UITableView!
    
    // MARK: - Interface Properties
    var interactor: InvestmentFundsInteractorProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()

        configureData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let headerView = tblFunds.tableHeaderView {

            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
            var headerFrame = headerView.frame

            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tblFunds.tableHeaderView = headerView
            }
        }
    }
    
    // MARK: - Private Methods
    fileprivate func configureData() {
        interactor?.fetchFunds()
    }
    
    // MARK: - InvestmentFundsViewControllerProtocol
    func setupHeader(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, investmentValue: Int) {
        guard let headerView = UINib(nibName: String(describing: InvestmentFundsHeaderView.self), bundle: nil).instantiate(withOwner: self, options: nil).first as? InvestmentFundsHeaderView else {
            return
        }
        
        headerView.setup(title: title, fundName: fundName, whatIs: whatIs, definition: definition, riskTitle: riskTitle, investmentValue: investmentValue)
        
        tblFunds.tableHeaderView = headerView
    }
    
    func setupFooter() {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tblFunds.bounds.width, height: 135))
        let button = RedRoundedButton(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        
        tblFunds.tableFooterView = footerView
        
        footerView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 30).isActive = true
        button.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -30).isActive = true
        button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        button.setup(title: "Investir")
    }
    
    func downloadRequest() {
        InvestmentFundsRouter.openSafariViewController(initialViewController: self)
    }
    
    func showError(errorMessage: String) {
        showErrorMessage(errorMessage: errorMessage)
    }
}
