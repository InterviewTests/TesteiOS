//
//  InvestmentViewController.swift
//  TesteiOS
//
//  Created by Ricardo Suman on 30/04/2018.
//  Copyright © 2018 Ricardo Suman. All rights reserved.
//

import UIKit

protocol InvestmentDisplayLogic: class {
    func displayFunds()
    func setData(viewModel: Investment.FundsEntity)
}

class InvestmentViewController: UIViewController {

    var interactor: InvestmentBusinessLogic?
    var fundEntity: Investment.FundsEntity?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblScreenTitle: UILabel!
    @IBOutlet weak var lblFundName: UILabel!
    @IBOutlet weak var lblWhatIs: UILabel!
    @IBOutlet weak var lblDefinition: UILabel!
    @IBOutlet weak var lblRiskTitle: UILabel!
    @IBOutlet weak var lblInfoTitle: UILabel!
    @IBOutlet weak var riskLevel: RiskLevelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        config()
        setupLayout()
        self.interactor?.showFunds()
    }
    
    func config() {
        let interactor = InvestmentInteractor()
        let presenter = InvestmentPresenter()
        presenter.viewController = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    func setupLayout() {
        tableView.separatorStyle = .none
    }
}

extension InvestmentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionOneCount = fundEntity?.getMoreInfo().count ?? 0
        let sectionTwoCount = fundEntity?.getInfos().count ?? 0
        return section == 0 ? sectionOneCount : sectionTwoCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            guard indexPath.row > 0 else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SectionOneCellId", for: indexPath) as! SectionOneTableViewCell
                
                cell.fieldTwo.textColor = UIColor.selectedGray
                cell.fieldThree.textColor = UIColor.selectedGray
                
                cell.fieldOne.text = ""
                cell.fieldTwo.text = "Fundo"
                cell.fieldThree.text = "CDI"
                
                return cell
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionOneCellId", for: indexPath) as! SectionOneTableViewCell
            
            if let fund = fundEntity {
                let moreInfo = fund.getMoreInfo()
                let info = moreInfo[indexPath.row]
                cell.fieldOne.text = info.title
                cell.fieldTwo.text = "\(info.fund)%"
                cell.fieldThree.text = "\(info.CDI)%"
            }
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SectionTwoCellId", for: indexPath) as! SectionTwoTableViewCell
            
            if let fund = fundEntity {
                let infos = fund.getInfos()
                let info = infos[indexPath.row]
                cell.fieldOne.text = info.name
                
                if let data = info.data {
                    cell.fieldTwo.text = data
                } else {
                    cell.showDownloadView()
                }
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}

extension InvestmentViewController: InvestmentDisplayLogic {
    func displayFunds() {
        UIView.animate(withDuration: 0.5) {
            self.scrollView.alpha = 1.0
        }
    }
    
    func setData(viewModel: Investment.FundsEntity) {
        self.fundEntity = viewModel
        self.tableView.reloadData()
        lblScreenTitle.text = viewModel.screen.title
        lblFundName.text = viewModel.screen.fundName
        lblWhatIs.text = viewModel.screen.whatIs
        lblDefinition.text = viewModel.screen.definition
        lblRiskTitle.text = viewModel.screen.riskTitle
        riskLevel.setRisk(viewModel.screen.risk)
        lblInfoTitle.text = viewModel.screen.infoTitle
    }
}
