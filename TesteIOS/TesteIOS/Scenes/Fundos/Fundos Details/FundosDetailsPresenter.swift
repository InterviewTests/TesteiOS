//
//  FundosDetailsPresenter.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundosDetailsPresentationLogic {
    func presentFundo(response: FundosDetails.GetFund.Response)
}

class FundosDetailsPresenter: FundosDetailsPresentationLogic {
    weak var viewController: FundosDetailsDisplayLogic?
    
    //    MARK: - Fetch Fundo
    func presentFundo(response: FundosDetails.GetFund.Response) {
        
        if let error = response.error {
            let viewModel = FundosDetails.GetFund.ViewModel(displayedFund: nil, error: error)
            viewController?.displayFundo(viewModel: viewModel)
        }
        
        guard let fundo = response.fundo else {
            return
        }
        
        let month = FundosDetails.GetFund.ViewModel.DisplayedFundPeriodInfo(fund: fundo.moreInfo.month.fund, cdi: fundo.moreInfo.month.cdi)
        let year = FundosDetails.GetFund.ViewModel.DisplayedFundPeriodInfo(fund: fundo.moreInfo.year.fund, cdi: fundo.moreInfo.year.cdi)
        let twelveMonths = FundosDetails.GetFund.ViewModel.DisplayedFundPeriodInfo(fund: fundo.moreInfo.twelveMonths.fund, cdi: fundo.moreInfo.twelveMonths.cdi)
        
        let moreInfo = FundosDetails.GetFund.ViewModel.DisplayedFundMoreInfo(month: month, year: year, twelveMonths: twelveMonths)
        
        var info: [FundosDetails.GetFund.ViewModel.DisplayedFundInfo] = []
        for infoItem in fundo.info {
            info.append(FundosDetails.GetFund.ViewModel.DisplayedFundInfo(name: infoItem.name, data: infoItem.data))
        }
        
        var downInfo: [FundosDetails.GetFund.ViewModel.DisplayedFundInfo] = []
        for infoItem in fundo.downInfo {
            downInfo.append(FundosDetails.GetFund.ViewModel.DisplayedFundInfo(name: infoItem.name, data: infoItem.data))
        }
        
        let displayedFundo = FundosDetails.GetFund.ViewModel.DisplayedFund(title: fundo.title, fundName: fundo.fundName, whatIs: fundo.whatIs, definition: fundo.definition, riskTitle: fundo.riskTitle, risk: fundo.risk, infoTitle: fundo.infoTitle, moreInfo: moreInfo, info: info, downInfo: downInfo)
        
        let viewModel = FundosDetails.GetFund.ViewModel(displayedFund: displayedFundo, error: nil)
        viewController?.displayFundo(viewModel: viewModel)
    }
}
