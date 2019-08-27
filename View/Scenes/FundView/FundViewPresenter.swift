//
//  FundViewPresenter.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 24/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Domain
import RxSwift

protocol FundCell {
    func configure(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, infoTitle: String, riskIndex: Int, monthInfo: (String, String), yearInfo: (String, String), twelveMonths: (String, String))
}

protocol FundInfoCell {
    func configure(title: String, text: String)
}

protocol FundDownInfoCell {
    func configure(title: String, buttonText: String)
}

protocol FundView: BasicView {
    func refresh()
    func goToFundDetails()
}

protocol FundViewPresenter: BasicPresenter {
    func getRowCount() -> Int
    func getRowStartPositionOfFundInfo() -> Int
    func getRowStartPositionOfFundDownInfo() -> Int
    func configure(cell: FundCell)
    func configure(cell: FormViewCell)
    func configure(cell: FundInfoCell, at row: Int)
    func configure(cell: FundDownInfoCell, at row: Int)
    
}

class FundViewPresenterImplementation: FundViewPresenter {
    
    
    private var disposeBag = DisposeBag()
    private var fund: Fund? = nil
    private var apiUseCase: ApiUseCase!
    private var isWaitingServer = false
    
    private weak var view: FundView?
    
    init(view: FundView, apiUseCase: ApiUseCase) {
        self.view = view
        self.apiUseCase = apiUseCase
    }
    
    func viewDidLoad() {
        getFundInfo()
    }

    // MARK: Presenter functions
    func getRowCount() -> Int {
        guard let fund = fund else { return 0 }
        return 1 + fund.info.count + fund.downInfo.count  + 1
    }
    
    func getRowStartPositionOfFundInfo() -> Int {
        return 1
    }
    
    func getRowStartPositionOfFundDownInfo() -> Int {
        guard let fund = fund else { return 1 }
        return 1 + fund.info.count
    }
    
    func configure(cell: FundCell) {
        guard let fund = fund else { return }
        let moreInfo = fund.moreInfo
        cell.configure(
            title: fund.title,
            fundName: fund.fundName,
            whatIs: fund.whatIs,
            definition: fund.definition,
            riskTitle: fund.riskTitle,
            infoTitle: fund.infoTitle,
            riskIndex: fund.risk,
            monthInfo: (moreInfo.month.fund.formatAsPercentage(), moreInfo.month.cdi.formatAsPercentage()),
            yearInfo: (moreInfo.year.fund.formatAsPercentage(), moreInfo.year.cdi.formatAsPercentage()),
            twelveMonths: (moreInfo.twelveMonths.fund.formatAsPercentage(), moreInfo.twelveMonths.cdi.formatAsPercentage()))
    }
    
    func configure(cell: FundInfoCell, at row: Int) {
        guard let fund = fund else { return }
        let i = row - getRowStartPositionOfFundInfo()
        let fundInfo = fund.info[i]
        cell.configure(title: fundInfo.name, text: fundInfo.data)
    }
    
    func configure(cell: FundDownInfoCell, at row: Int) {
        guard let fund = fund else { return }
        let i = row - getRowStartPositionOfFundDownInfo()
        let fundDownInfo = fund.downInfo[i]
        cell.configure(title: fundDownInfo.name, buttonText: fundDownInfo.data)
    }
    
    // Button cell
    func configure(cell: FormViewCell) {
        guard fund != nil else { return }
        cell.configure(id: 1, message: "Investir", fieldType: .text, userInput: nil, enabled: true, hidden: false, topSpacing: 16, delegate: self)
    }

    // MARK: Use Case
    private func getFundInfo() {
        apiUseCase.getFundInfo()
            .subscribe(onNext: { [weak self] result in
                self?.fund = result
                self?.view?.refresh()
            }, onError: { [weak self] error in
                self?.view?.showError(error)
            })
            .disposed(by: disposeBag)
    }
}


extension FundViewPresenterImplementation: FormViewCellDelegate {
    func sendButtonPressed() {
        view?.goToFundDetails()
    }
    
    func saveUserInput(_ text: Any, id: Int) { }
    
    
}
