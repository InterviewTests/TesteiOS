//
//  FundViewController.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit


class FundViewController: UIViewController {
    
    @IBOutlet weak var tableViewFund: UITableView!
    var fundPresenter:FundPresender!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fundPresenter = FundPresender(service: FundServiceImp(), view: self)
        fundPresenter.loadFunds()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func investButtonTapped(_ sender: CustomButton) {
        sender.usedButton()
        
    }
    
    
    @IBAction func formButtonTapped(_ sender: CustomButton) {
        performSegue(withIdentifier: "goToFormController", sender: nil)
    }
    
    
}

extension FundViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let fundPresenter = fundPresenter else{return 0}
        return fundPresenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let fundNameTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FundNameTableViewCell") as? FundNameTableViewCell else {
                fatalError("Erro ao criar celula FundNameTableViewCell")
                
            }
            fundNameTableViewCell.setup(with: FundNameTableDataViewCell(with: self.fundPresenter.screenFunds))
            return fundNameTableViewCell
        case 1:
            guard let aboutTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell") as? AboutTableViewCell else {
                fatalError("Erro ao criar celula AboutTableViewCell")
                
            }
            aboutTableViewCell.setup(with: AboutTableDataViewCell(with: self.fundPresenter.screenFunds))
            return aboutTableViewCell
        case 2:
            guard let riskTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RiskTableViewCell") as? RiskTableViewCell else {
                fatalError("Erro ao criar celula RiskTableViewCell")
                
            }
            riskTableViewCell.setup(with: RiskTableDataViewCell(with: self.fundPresenter.screenFunds))
            return riskTableViewCell
        case 3:
            guard let moreInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MoreInfoTableViewCell") as? MoreInfoTableViewCell else {
                fatalError("Erro ao criar celula MoreInfoTableViewCell")
                
            }
            moreInfoTableViewCell.setup(with: MoreInfoTableDataViewCell(with: self.fundPresenter.screenFunds))
            return moreInfoTableViewCell
        case 4..<4+fundPresenter.numberOfItemsForInfo:
            guard let infoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as? InfoTableViewCell else {
                fatalError("Erro ao criar celula InfoTableViewCell")
                
            }
            infoTableViewCell.setup(with: InfoTableDataViewCell(with: self.fundPresenter.getInfo(for: indexPath.row)))
            return infoTableViewCell
        case 4+fundPresenter.numberOfItemsForInfo..<fundPresenter.numberOfItems:
            guard let downInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DownInfoTableViewCell") as? DownInfoTableViewCell else {
                fatalError("Erro ao criar celula DownInfoTableViewCell")
                
            }
       
            downInfoTableViewCell.setup(with: DownInfoTableDataViewCell(with: self.fundPresenter.getDownInfo(for: indexPath.row )))
            
            return downInfoTableViewCell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
extension FundViewController:UITableViewDelegate{
    
}

extension FundViewController:FundProtocol{
    func updateWithLoadedFunds() {
        FundNameTableViewCell.register(to: tableViewFund)
        AboutTableViewCell.register(to: tableViewFund)
        RiskTableViewCell.register(to: tableViewFund)
        MoreInfoTableViewCell.register(to: tableViewFund)
        InfoTableViewCell.register(to: tableViewFund)
        DownInfoTableViewCell.register(to: tableViewFund)
        
        
        
        
        
        tableViewFund.delegate = self
        tableViewFund.dataSource = self
        tableViewFund.reloadData()
    }
    
    
}
