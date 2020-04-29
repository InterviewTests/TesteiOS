//
//  InvestmentFundsViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol InvestmentFundsViewControllerProtocol {
    var tblFunds: UITableView! {get set}
    
    func setupHeader(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, investmentValue: Int)
}

class InvestmentFundsViewController: UIViewController, InvestmentFundsViewControllerProtocol {
    
    // MARK: - Properties
    @IBOutlet weak var tblFunds: UITableView!
    
    // MARK: - Interface Properties
    var interactor: InvestmentFundsInteractorProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
        configureUI()
        configureData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let headerView = tblFunds.tableHeaderView {

            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
            var headerFrame = headerView.frame

            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tblFunds.tableHeaderView = headerView
            }
        }
    }
    
    fileprivate func configureUI() {
        
    }
    
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
}
