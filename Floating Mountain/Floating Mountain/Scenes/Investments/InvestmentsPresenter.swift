//
//  InvestmentsPresenter.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright (c) 2018 Leonardo Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

protocol InvestmentsPresentationLogic {
    func presentFunds(response: Investments.FetchInvestments.Response)
    func presentMoreInfo()
}

class InvestmentsPresenter: InvestmentsPresentationLogic {
    weak var viewController: InvestmentsDisplayLogic?
    
    lazy var percentFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func presentFunds(response: Investments.FetchInvestments.Response) {
        
        if let screen = response.fund?.screen {
            let monthDetailsViewModel = Investments.FetchInvestments.ViewModel.MoreInfoViewModel.DetailsViewModel(
                fund: percentFormatter.string(from: screen.moreInfo.month.fund / 100.0 as NSNumber),
                cdi: percentFormatter.string(from: screen.moreInfo.month.cdi / 100.0 as NSNumber))
            let yearDetailsViewModel = Investments.FetchInvestments.ViewModel.MoreInfoViewModel.DetailsViewModel(
                fund: percentFormatter.string(from: screen.moreInfo.year.fund / 100.0 as NSNumber),
                cdi: percentFormatter.string(from: screen.moreInfo.year.cdi / 100.0 as NSNumber))
            let twelveDetailsViewModel = Investments.FetchInvestments.ViewModel.MoreInfoViewModel.DetailsViewModel(
                fund: percentFormatter.string(from: screen.moreInfo.twelveMonths.fund / 100.0 as NSNumber),
                cdi: percentFormatter.string(from: screen.moreInfo.twelveMonths.cdi / 100.0 as NSNumber))
            
            
            let moreInfoViewModel = Investments.FetchInvestments.ViewModel.MoreInfoViewModel(
                month: monthDetailsViewModel,
                year: yearDetailsViewModel,
                twelveMonths: twelveDetailsViewModel)
            
            let infoViewModels = screen.info.map { info in
                Investments.FetchInvestments.ViewModel.InfoViewModel(name: info.name, data: info.data, showsDownloadButton: false)
            }
            
            let downInfoViewModels = screen.downInfo.map { info in
                Investments.FetchInvestments.ViewModel.InfoViewModel(name: info.name, data: info.data, showsDownloadButton: true)
            }
            
            let viewModel = Investments.FetchInvestments.ViewModel(
                title: screen.title,
                fundName: screen.fundName,
                whatIs: screen.whatIs,
                definition: screen.definition,
                riskTitle: screen.riskTitle,
                risk: screen.risk,
                infoTitle: screen.infoTitle,
                moreInfo: moreInfoViewModel,
                info: infoViewModels,
                downInfo: downInfoViewModels
            )
            viewController?.displayInvestments(viewModel: viewModel)
        } else if let error = response.error {
            viewController?.displayError(error: error)
        }
        
    }
    
    func presentMoreInfo() {
        viewController?.displayMoreInfo(at: URL(string: "https://www.google.com")!)
    }
}
