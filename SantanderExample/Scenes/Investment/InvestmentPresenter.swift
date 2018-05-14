//
//  InvestmentPresenter.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 09/05/2018.
//  Copyright (c) 2018 Luan Henrique Damasceno Costa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol InvestmentPresentationLogic {
  func presentFetchedInvestment(response: Investment.GetInvestment.Response)
  func presentFetchedError(response: Investment.GetInvestment.ErrorResponse)
}

class InvestmentPresenter: InvestmentPresentationLogic {
  weak var viewController: InvestmentDisplayLogic?
  
  private var riskCells: [InvestmentRiskCollectionViewCell.ViewModel] = []
  
  init() {
    riskCells = mountInvestmentRiskModels()
  }
  
  func presentFetchedInvestment(response: Investment.GetInvestment.Response) {
    guard let investment = response.fundResponse.screen else {
      viewController?.displayError(title: "An error has occur when getting investment fund", message: "Try again later!")
      return
    }
    
    let viewModel = mountInvestmentScreen(investment: investment)
    
    viewController?.displayInvestment(viewModel: viewModel)
  }
  
  func presentFetchedError(response: Investment.GetInvestment.ErrorResponse) {
    switch response.error {
    case .businessError(let err):
      guard let message = err.text,
        let title = err.title else {
          viewController?.displayError(title: "An error has occur.", message: "Try again later.")
          return
      }
      viewController?.displayError(title: title, message: message)
      
    case .moyaError(_):
      viewController?.displayError(title: "An error has occur.", message: "Try again later.")
      
    }
  }
  
  public func mountInvestmentScreen(investment: InvestmentScreen) -> Investment.GetInvestment.ViewModel {
    var viewModel = Investment.GetInvestment.ViewModel(
      mainInformation: Investment.GetInvestment.ViewModel.MainInvestmentInformation(
        title: investment.title ?? "-",
        fund: investment.fundName ?? "-",
        whatIs: investment.whatIs ?? "-",
        definition: investment.definition ?? "-",
        riskTitle: investment.riskTitle ?? "-",
        infoTitle: investment.infoTitle ?? "-",
        monthFund: "\(investment.moreInfo?.month?.fund ?? 0.0) %",
        monthCDI: "\(investment.moreInfo?.month?.cdi ?? 0.0) %",
        yearFund: "\(investment.moreInfo?.year?.fund ?? 0.0) %",
        yearCDI: "\(investment.moreInfo?.year?.cdi ?? 0.0) %",
        lastYearFund: "\(investment.moreInfo?.lastTwelveMonths?.fund ?? 0.0) %",
        lastYearCDI: "\(investment.moreInfo?.lastTwelveMonths?.cdi ?? 0.0) %"),
      riskCollectionModels: [],
      informationTableModels: [])
    
    riskCells[investment.risk ?? 0].isSelected = true
    viewModel.riskCollectionModels = riskCells
    
    if let informationList = investment.info {
      viewModel.informationTableModels = mountInvestmentInformationModels(list: informationList)
    }
    
    if let downInfoList = investment.downInfo {
      viewModel.informationTableModels += mountInvestmentInformationModels(list: downInfoList)
    }
    
    return viewModel
  }
  
  private func mountInvestmentInformationModels(list: [InvestmentInformation]) -> [Investment.InvestmentInformationTableCell.ViewModel] {
    var informationList: [Investment.InvestmentInformationTableCell.ViewModel] = []
    
    informationList = list.compactMap({ (information) -> Investment.InvestmentInformationTableCell.ViewModel in
      return Investment.InvestmentInformationTableCell.ViewModel(title: information.name ?? "-", description: information.data ?? "-", type: (information.data == nil) ? .noData : .withData)
    })
    
    return informationList
  }
  
  private func mountInvestmentRiskModels() -> [InvestmentRiskCollectionViewCell.ViewModel] {
    let veryLowRisk = InvestmentRiskCollectionViewCell.ViewModel(color: Colors.shared.getVeryLowRiskColor(), isSelected: false, cellType:  .first)
    let lowRisk = InvestmentRiskCollectionViewCell.ViewModel(color: Colors.shared.getLowRiskColor(), isSelected: false, cellType: .normal)
    let normalRisk = InvestmentRiskCollectionViewCell.ViewModel(color: Colors.shared.getMediumRiskColor(), isSelected: false, cellType: .normal)
    let warningRisk = InvestmentRiskCollectionViewCell.ViewModel(color: Colors.shared.getAlertRiskColor(), isSelected: false, cellType: .normal)
    let alertRisk = InvestmentRiskCollectionViewCell.ViewModel(color: Colors.shared.getCriticalRiskColor(),  isSelected: false, cellType: .last)
    
    return [veryLowRisk, lowRisk, normalRisk, warningRisk, alertRisk]
  }
}
