//
//  SantanderFundsViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 15/07/2018.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
protocol BuilderFundView{
    func buildFundMainView(header: FundHeaderTableView, screenInfo: ScreenInfo)
    func buildFundStatsView(moreInfoCell: MoreInfoTableViewCell, moreInfoMonth: MoreInfoScreen, indexPath: IndexPath)
}

class SantanderFundsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var downInfo: [DownInfo] = []
    var info: [Info] = []
    var moreInfo: MoreInfoScreen!
    var headerInfo: ScreenInfo!
}

extension SantanderFundsViewController{
    //MARK: UIViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibHeader = UINib.init(nibName: "FundHeaderTableView", bundle: nil)
        let nibMorefundsHeader = UINib.init(nibName: "MoreInfoHeaderView", bundle: nil)

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "FundHeaderTableView")
        self.tableView.register(nibMorefundsHeader, forHeaderFooterViewReuseIdentifier: "MoreInfoHeaderView")
        
        self.tableView.register(R.nib.moreInfoTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.moreInfoTableViewCell.identifier)
        self.tableView.register(R.nib.santanderFundTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.santanderFundTableViewCell.identifier)
        
        self.tableView.register(R.nib.santanderInvestmentRiskIndicatorCellTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.santanderInvestmentRiskIndicatorCellTableViewCell.identifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SantanderPresenter.sharedManager.fetchedFundScreen(completion: { (screen, error) in
            
            guard let screenInfo = screen?.screenData else {return}
            self.headerInfo = screenInfo
            self.downInfo = screenInfo.downinfo!
            self.info = screenInfo.info!
            self.moreInfo = screenInfo.moreInfo!
            
            self.tableView.reloadData()
            
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    @objc func clickedDownloadButton(){
//        self.startWebView(url: "https://www.google.com")
    }
    func unHideDownloadIcon(cell: SantanderFundTableViewCell){
        cell.downloadIcon.isHidden = false
        cell.downloadIcon.addTarget(self, action: #selector(clickedDownloadButton), for: UIControlEvents.touchUpInside)
    }
}
extension SantanderFundsViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: UITableViewDelegate
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
            case 0:
                return 1
            case 1:
                return 3
            case 2:
                return (self.downInfo.count) + (self.info.count)
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.section{
        case 0:
            let cell: SantanderInvestmentRiskIndicatorCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.santanderInvestmentRiskIndicatorCellTableViewCell.identifier, for: indexPath) as! SantanderInvestmentRiskIndicatorCellTableViewCell
            
            configureCellInvestment(cell: cell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.moreInfoTableViewCell.identifier) as! MoreInfoTableViewCell
            configureMoreInfoCell(cell: cell, indexPath: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.santanderFundTableViewCell.identifier, for: indexPath) as! SantanderFundTableViewCell
            configureCell(cell: cell, forRowAt: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    
//        configureCell(cell: cell, forRowAt: indexPath)
//        return cell
    }
    
    func configureMoreInfoCell(cell: MoreInfoTableViewCell, indexPath: IndexPath){
        guard let moreInfo = self.moreInfo else {return}
        self.buildFundStatsView(moreInfoCell: cell, moreInfoMonth: moreInfo, indexPath: indexPath)
    }
    func configureCellInvestment(cell: SantanderInvestmentRiskIndicatorCellTableViewCell){
        
    }
    func configureCell(cell: SantanderFundTableViewCell, forRowAt indexPath: IndexPath) {
        
        if(indexPath.row < (self.info.count)){
            let index = indexPath.row
            if let nameValue = self.info[index].name {
                cell.name.text = nameValue
            }
            if let dataValue = self.info[index].data {
                cell.data.text = dataValue
            }else{
                cell.data.text = "Baixar"
            }
        }else{
            let index = indexPath.row - (self.info.count)
            if let nameValue = self.downInfo[index].name {
                cell.name.text = nameValue
            }
            if let dataValue = self.downInfo[index].data {
                cell.data.text = dataValue
            }else if(indexPath.section == 2){
                cell.data.text = "Baixar"
                
                self.unHideDownloadIcon(cell: cell)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        switch indexPath.section{
            case 0:
                return 100
        
            case 1:
                return 50
        
            case 2:
                return 70
            default:
                return 100
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return CGFloat(300)
        }
        if section == 1{
            return CGFloat(120)
        }
        
        return CGFloat(0)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0{
            let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "FundHeaderTableView") as! FundHeaderTableView
            guard let headerInfo = self.headerInfo else { return cell}
            self.buildFundMainView(header: cell, screenInfo: headerInfo)
            return cell
        }
        if section == 1{
            let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "MoreInfoHeaderView") as! MoreInfoHeaderView
            return cell
        }
        return UIView()
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        
//    }
}

extension SantanderFundsViewController: BuilderFundView{
    
    func buildFundMainView(header: FundHeaderTableView, screenInfo: ScreenInfo){
        let fundName = (screenInfo.fundName)
        let topTitle = (screenInfo.title)
        let definition = (screenInfo.definition)
        let riskTitle = (screenInfo.riskTitle)
        let whatIs = (screenInfo.whatIs)
        let moreInfo = (screenInfo.infoTitle)
        let risk = (screenInfo.risk)
        header.definition.text = definition
        header.fundName.text = fundName
        header.subtitle.text = topTitle
        header.whatIs.text = whatIs
        
//        self.santanderFundView.startFundView(subtitle: topTitle, fundName: fundName, whatIs: whatIs, riskTitle: riskTitle, definitionLabel: definition, moreInfo: moreInfo, risk: risk)
    }
    
    func buildFundStatsView(moreInfoCell: MoreInfoTableViewCell, moreInfoMonth: MoreInfoScreen, indexPath: IndexPath){
        
        switch indexPath.row{
        case 0:
            let monthlyFund = String(format:"%.1f", (moreInfoMonth.month!["fund"]!)) + "%"
            let monthlyCDI = String(format:"%.1f", (moreInfoMonth.month!["CDI"]!)) + "%"

            moreInfoCell.periodLabel.text = "No mes"
            moreInfoCell.statsFund.text = monthlyFund
            moreInfoCell.statsCDI.text = monthlyCDI
            
        case 1:
            let annuallyFund = String(format:"%.1f", (moreInfoMonth.year!["fund"]!)) + "%"
            let annuallyCDI = String(format:"%.1f", (moreInfoMonth.year!["CDI"]!)) + "%"

            moreInfoCell.periodLabel.text = "No ano"
            moreInfoCell.statsFund.text = annuallyFund
            moreInfoCell.statsCDI.text = annuallyCDI
        case 2:
            let twelveMonthsFund = String(format:"%.1f", (moreInfoMonth.twelvemonths!["fund"]!)) + "%"
            let twelveMonthsCDI = String(format:"%.1f", (moreInfoMonth.twelvemonths!["CDI"]!)) + "%"
            
            moreInfoCell.periodLabel.text = "12 meses"
            moreInfoCell.statsFund.text = twelveMonthsFund
            moreInfoCell.statsCDI.text = twelveMonthsCDI
        default:
            break
        }
       
    }
    
    
}
