//
//  SantanderFundViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 30/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

protocol BuilderFundView{
    func buildFundMainView(screenInfo: ScreenInfo)
    func buildFundStatsView(moreInfoMonth: MoreInfoScreen)
    func buildCDIStatsView(moreInfoMonth: MoreInfoScreen)
}

class SantanderFundViewController: UIViewController {

    
    @IBOutlet var santanderFundView: SantanderFundView!
    
    override func viewDidLoad() {
        
        SantanderPresenter.sharedManager.fetchedFundScreen(completion: { (screen, error) in

            let screenInfo = screen?.screenData!
            self.buildFundMainView(screenInfo: screenInfo!)
            
            let moreInfoMonth =  (screenInfo?.moreInfo)!
            self.buildFundStatsView(moreInfoMonth: moreInfoMonth)
            self.buildCDIStatsView(moreInfoMonth: moreInfoMonth)
            
        })
    }
    
    
}

extension SantanderFundViewController: BuilderFundView{
    func buildFundMainView(screenInfo: ScreenInfo){
        let fundName = (screenInfo.fundName)!
        let topTitle = (screenInfo.title)!
        let definition = (screenInfo.definition)!
        let riskTitle = (screenInfo.riskTitle)!
        let whatIs = (screenInfo.whatIs)!
        let moreInfo = (screenInfo.infoTitle)!
        self.santanderFundView.startFundView(subtitle: topTitle, fundName: fundName, whatIs: whatIs, riskTitle: riskTitle, definitionLabel: definition, moreInfo: moreInfo)
    }
    
    func buildFundStatsView(moreInfoMonth: MoreInfoScreen){
        let monthlyFund = String(format:"%.1f", (moreInfoMonth.month!["fund"]!))
        let annuallyFund = String(format:"%.1f", (moreInfoMonth.year!["fund"]!))
        let twelveMonthsFund = String(format:"%.1f", (moreInfoMonth.twelvemonths!["fund"]!))
        
        self.santanderFundView.startFundStats(monthlyFund: monthlyFund, annuallyFund: annuallyFund, twelveMonthsFund: twelveMonthsFund)
    }
    
    func buildCDIStatsView(moreInfoMonth: MoreInfoScreen){
        let monthlyCDI = String(format:"%.1f", (moreInfoMonth.month!["CDI"]!))
        let annuallyCDI = String(format:"%.1f", (moreInfoMonth.year!["CDI"]!))
        let twelveMonthsCDI = String(format:"%.1f", (moreInfoMonth.twelvemonths!["CDI"]!))
        
        self.santanderFundView.startCDIStats(monthlyCDI: monthlyCDI, annuallyCDI: annuallyCDI, twelveMonthsCDI: twelveMonthsCDI)
    }
    
}


