//
//  FundPresenter.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

protocol FundsPresentationLogic {
    func presentFetchedFunds(response: Funds.FetchFunds.Response)
}

class FundsPresenter: FundsPresentationLogic {
    weak var viewController: FundsDisplayLogic?
    
    // MARK: - Fetch orders
    
    func presentFetchedFunds(response: Funds.FetchFunds.Response) {
        var displayedFunds: [Funds.FetchFunds.ViewModel.DisplayedFund] = []
        for fund in response.funds {
            let title = fund.title
            let fundName = fund.fundName
            let whatIs = fund.whatIs
            let definition = fund.definition
            let riskTitle = fund.riskTitle
            let risk = fund.risk
            let infoTitle = fund.infoTitle
            
            let moreInfoMonth = Funds.FetchFunds.ViewModel.DisplayedMonth(fund: fund.moreInfo.month.fund, cdi: fund.moreInfo.month.cdi)
            let moreInfoYear = Funds.FetchFunds.ViewModel.DisplayedYear(fund: fund.moreInfo.year.fund, cdi: fund.moreInfo.year.cdi)
            let moreInfo12Months = Funds.FetchFunds.ViewModel.DisplayedTwelveMonths(fund: fund.moreInfo.twelveMonths.fund, cdi: fund.moreInfo.twelveMonths.cdi)
            let moreInfo = Funds.FetchFunds.ViewModel.DisplayedMoreInfo(month: moreInfoMonth, year: moreInfoYear, twelveMonths: moreInfo12Months)
            
            var info: [Funds.FetchFunds.ViewModel.DisplayedInfo] = []
            for fundInfo in fund.info {
                info.append(Funds.FetchFunds.ViewModel.DisplayedInfo(name: fundInfo.name, data: fundInfo.data))
            }
            
            var downInfo: [Funds.FetchFunds.ViewModel.DisplayedInfo] = []
            for fundDownInfo in fund.downInfo {
                downInfo.append(Funds.FetchFunds.ViewModel.DisplayedInfo(name: fundDownInfo.name, data: fundDownInfo.data))
            }
            
            let displayedFund = Funds.FetchFunds.ViewModel.DisplayedFund(title: title, fundName: fundName, whatIs: whatIs, definition: definition, riskTitle: riskTitle, risk: risk, infoTitle: infoTitle, moreInfo: moreInfo, info: info, downInfo: downInfo)
            displayedFunds.append(displayedFund)
        }
        let viewModel = Funds.FetchFunds.ViewModel(displayedFunds: displayedFunds)
        viewController?.displayFetchedFunds(viewModel: viewModel)
    }
}
