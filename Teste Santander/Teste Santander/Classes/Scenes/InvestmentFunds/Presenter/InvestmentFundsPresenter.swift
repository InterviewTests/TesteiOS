//
//  InvestmentFundsPresenter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation
import UIKit

protocol InvestmentFundsPresenterProtocol: UITableViewDataSource {
    func handleFunds(funds: InvestmentModel)
}

class InvestmentFundsPresenter: NSObject, InvestmentFundsPresenterProtocol {
    
    // MARK: - Interface Properties
    var viewController: InvestmentFundsViewControllerProtocol?
    
    var funds: InvestmentModel?
    var infoItems: [Info]?
    
    // MARK: - Initialization
    init(viewController: InvestmentFundsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func handleFunds(funds: InvestmentModel) {
        self.funds = funds
        infoItems = funds.getInfoArrayList()
        
        viewController?.setupHeader(title: funds.title, fundName: funds.fundName,
                                    whatIs: funds.whatIs, definition: funds.definition,
                                    riskTitle: funds.riskTitle, investmentValue: funds.risk)
        
        configureTable()
    }
    
    // MARK: - Private Methods
    fileprivate func configureTable() {
        viewController?.tblFunds.register(UINib(nibName: String(describing: InvestmentFundInfoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: InvestmentFundInfoTableViewCell.self))
        
        viewController?.tblFunds.dataSource = self
        viewController?.tblFunds.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return infoItems?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let moreInfo = funds?.moreInfo, let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InvestmentFundInfoTableViewCell.self), for: indexPath) as? InvestmentFundInfoTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setup(moreInfo: moreInfo)
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}
