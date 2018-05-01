//
//  SantanderFundViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 30/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderFundViewController: UIViewController {

    
    @IBOutlet var santanderFundView: SantanderFundView!
    
    override func viewDidLoad() {
        
        SantanderPresenter.sharedManager.fetchedFundScreen(completion: { (screen, error) in
            print(screen)
            let screenInfo = screen?.screenData!
            
            let fundName = (screenInfo?.fundName)!
            let topTitle = (screenInfo?.title)!
            let definition = (screenInfo?.definition)!
            let riskTitle = (screenInfo?.riskTitle)!
            let whatIs = (screenInfo?.whatIs)!
            let moreInfo = (screenInfo?.infoTitle)!
            self.santanderFundView.startFundView(subtitle: topTitle, fundName: fundName, whatIs: whatIs, riskTitle: riskTitle, definitionLabel: definition, moreInfo: moreInfo)
            
            let moreInfoMonth =  (screenInfo?.moreInfo)
            let monthlyFund = String(format:"%.1f", (moreInfoMonth?.month!["fund"]!)!)
            let annuallyFund = String(format:"%.1f", (moreInfoMonth?.year!["fund"]!)!)
            let twelveMonthsFund = String(format:"%.1f", (moreInfoMonth?.twelvemonths!["fund"]!)!)
            
            self.santanderFundView.startFundStats(monthlyFund: monthlyFund, annuallyFund: annuallyFund, twelveMonthsFund: twelveMonthsFund)
//            print(monthlyFund)
//            let fundMonthly = moreInfoMonth?.index(forKey: "fund")
//            self.santanderFundView.startFundStats(monthlyFund: <#T##String#>, annuallyFund: <#T##String#>, twelveMonthsFund: <#T##String#>)
            
            let monthlyCDI = String(format:"%.1f", (moreInfoMonth?.month!["CDI"]!)!)
            let annuallyCDI = String(format:"%.1f", (moreInfoMonth?.year!["CDI"]!)!)
            let twelveMonthsCDI = String(format:"%.1f", (moreInfoMonth?.twelvemonths!["CDI"]!)!)
            
            self.santanderFundView.startCDIStats(monthlyCDI: monthlyCDI, annuallyCDI: annuallyCDI, twelveMonthsCDI: twelveMonthsCDI)

            
        })
    }
}
