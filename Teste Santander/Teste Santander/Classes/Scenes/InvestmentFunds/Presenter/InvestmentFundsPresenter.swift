//
//  InvestmentFundsPresenter.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation
import UIKit

protocol InvestmentFundsPresenterProtocol: UITableViewDataSource, UITableViewDelegate {
    func handleFunds(funds: InvestmentFundsViewModel)
    func handleError(error: Error?)
}

class InvestmentFundsPresenter: NSObject, InvestmentFundsPresenterProtocol, InvestmentFundsInfoTableViewCellProtocol {
    
    // MARK: - Interface Properties
    var viewController: InvestmentFundsViewControllerProtocol?
    
    // MARK: - Model Objects
    var funds: InvestmentFundsViewModel?
    
    // MARK: - Initialization
    init(viewController: InvestmentFundsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    // MARK: - InvestmentFundsPresenterProtocol
    func handleFunds(funds: InvestmentFundsViewModel) {
        self.funds = funds
        
        viewController?.setupHeader(title: funds.getTitle(), fundName: funds.getFundName(),
                                    whatIs: funds.getWhatIs(), definition: funds.getDefinition(),
                                    riskTitle: funds.getRiskTitle(), investmentValue: funds.getRisk())
        viewController?.setupFooter()
        
        configureTable()
    }
    
    func handleError(error: Error?) {
        if let errorMessge = error?.localizedDescription {
            viewController?.showError(errorMessage: errorMessge)
        }
    }
    
    // MARK: - Private Methods
    fileprivate func configureTable() {
        viewController?.tblFunds.register(UINib(nibName: String(describing: InvestmentFundMoreInfoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: InvestmentFundMoreInfoTableViewCell.self))
        viewController?.tblFunds.register(UINib(nibName: String(describing: InvestmentFundsInfoTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: InvestmentFundsInfoTableViewCell.self))
        
        viewController?.tblFunds.allowsSelection = false
        
        viewController?.tblFunds.dataSource = self
        viewController?.tblFunds.delegate = self
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
            return funds?.getInfoItems().count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let moreInfo = funds?.getMoreInfo(), let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InvestmentFundMoreInfoTableViewCell.self), for: indexPath) as? InvestmentFundMoreInfoTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setup(moreInfo: moreInfo)
            
            return cell
            
        case 1:
            guard let info = funds?.getInfoItems()[indexPath.row], let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InvestmentFundsInfoTableViewCell.self), for: indexPath) as? InvestmentFundsInfoTableViewCell else {
                return UITableViewCell()
            }
            
            cell.setup(info: info, infoType: funds?.getInfoType(info: info))
            cell.delegate = self
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    // MARK: - InvestmentFundsInfoTableViewCellProtocol
    func downloadRequest() {
        viewController?.downloadRequest()
    }
}
