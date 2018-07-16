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
        
       self.setupTableView()

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
        self.info = []
        self.downInfo = []
        
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
    
    fileprivate func setupTableView(){
        let nibHeader = UINib.init(nibName: "FundHeaderTableView", bundle: nil)
        let nibMorefundsHeader = UINib.init(nibName: "MoreInfoHeaderView", bundle: nil)
        let nibInvestButtonFooter = UINib.init(nibName: "InvestButtonFooter", bundle: nil)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(nibHeader, forHeaderFooterViewReuseIdentifier: "FundHeaderTableView")
        self.tableView.register(nibMorefundsHeader, forHeaderFooterViewReuseIdentifier: "MoreInfoHeaderView")
        self.tableView.register(nibInvestButtonFooter, forHeaderFooterViewReuseIdentifier: "InvestButtonFooter")
        
        self.tableView.register(R.nib.moreInfoTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.moreInfoTableViewCell.identifier)
        self.tableView.register(R.nib.santanderFundTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.santanderFundTableViewCell.identifier)
        
        self.tableView.register(R.nib.santanderInvestmentRiskIndicatorCellTableViewCell(), forCellReuseIdentifier: R.reuseIdentifier.santanderInvestmentRiskIndicatorCellTableViewCell.identifier)
    }
}

