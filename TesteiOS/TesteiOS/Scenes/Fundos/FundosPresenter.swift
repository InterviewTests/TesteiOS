//
//  FundosPresenter.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 28/06/18.
//  Copyright (c) 2018 Accenture. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FundosPresentationLogic
{
  func presentFetchedFund(response: Fundos.Something.Response)
}

class FundosPresenter: FundosPresentationLogic
{
  weak var viewController: FundosDisplayLogic?
    
    private var riskCells: [RiskCellCollectionViewCell.ViewModel] = []
    
    init() {
        riskCells = mountFundosRiskModels()
    }
  
  // MARK: Do something
  
  func presentFetchedFund(response: Fundos.Something.Response)
  {
    let viewModel = mountFundosScreen(fund: response.fund)
    viewController?.displayFundScreen(viewModel: viewModel)
  }
    
    public func mountFundosScreen(fund: Fund) -> Fundos.Something.ViewModel {
        var viewModel = Fundos.Something.ViewModel(
            fundScreenTop: Fundos.Something.ViewModel.FundScreenTop(
                title: fund.screen.title ?? "",
                fundName: fund.screen.fundName ?? "",
                whatIs: fund.screen.whatIs ?? "",
                definition: fund.screen.definition ?? "",
                riskTitle: fund.screen.riskTitle ?? "",
                riskCollectionModels: [],
                infoTitle: fund.screen.infoTitle ?? "",
                moreInfoMonthFund: "\(fund.screen.moreInfo?.month?.fund ?? 0.0) %",
                moreInfoMonthCDI: "\(fund.screen.moreInfo?.month?.cdi ?? 0.0) %",
                moreInfoYearFund: "\(fund.screen.moreInfo?.year?.fund ?? 0.0) %",
                moreInfoYearCDI: "\(fund.screen.moreInfo?.year?.cdi ?? 0.0) %",
                moreInfo12monthsFund: "\(fund.screen.moreInfo?.twelveMonths?.fund ?? 0.0) %",
                moreInfo12monthsCDI: "\(fund.screen.moreInfo?.twelveMonths?.cdi ?? 0.0) %"
            ),
            infoCells: []
        )
        
        riskCells[fund.screen.risk ?? 0].isRiskSelect = true
        viewModel.fundScreenTop.riskCollectionModels = riskCells
        
        viewModel.infoCells = []
        fund.screen.info.forEach({ info in
            let infoCell = Fundos.InfoCell(
                typeInfoCell: TypeInfoCell.info,
                infoName: info.name ?? "",
                infoData: info.data ?? ""
            )
            viewModel.infoCells.append(infoCell)
        })
        fund.screen.downInfo.forEach({ info in
            let infoCell = Fundos.InfoCell(
                typeInfoCell: TypeInfoCell.infoDown,
                infoName: info.name ?? "",
                infoData: info.data ?? ""
            )
            viewModel.infoCells.append(infoCell)
        })
        
        return viewModel
    }
    
    private func mountFundosRiskModels() -> [RiskCellCollectionViewCell.ViewModel] {
        let r1 = RiskCellCollectionViewCell.ViewModel(riskColor: RiskColor.r1, isRiskSelect: false)
        let r2 = RiskCellCollectionViewCell.ViewModel(riskColor: RiskColor.r2, isRiskSelect: false)
        let r3 = RiskCellCollectionViewCell.ViewModel(riskColor: RiskColor.r3, isRiskSelect: false)
        let r4 = RiskCellCollectionViewCell.ViewModel(riskColor: RiskColor.r4, isRiskSelect: false)
        let r5 = RiskCellCollectionViewCell.ViewModel(riskColor: RiskColor.r5, isRiskSelect: false)
        
        return [r1, r2, r3, r4, r5]
    }
}
