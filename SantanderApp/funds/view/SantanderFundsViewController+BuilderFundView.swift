//
//  SantanderFundsViewController+BuilderFundView.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 15/07/2018.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import Foundation

extension SantanderFundsViewController: BuilderFundView{
    
    func buildFundMainView(header: FundHeaderTableView, screenInfo: ScreenInfo){
        let fundName = (screenInfo.fundName)
        let topTitle = (screenInfo.title)
        let definition = (screenInfo.definition)
        let whatIs = (screenInfo.whatIs)
        let risk = (screenInfo.risk)
        header.definition.text = definition
        header.fundName.text = fundName
        header.subtitle.text = topTitle
        header.whatIs.text = whatIs
        
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
