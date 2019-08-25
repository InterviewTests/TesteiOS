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
    func configure(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, infoTitle: String, riskIndex: Int)
}

protocol FundView: BasicView {
    func refresh()
    func goToFundDetails()
}

protocol FundViewPresenter: BasicPresenter {
    func getRowCount() -> Int
    func configure(cell: FundCell)
    
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
        return 1 + fund.downInfo.count + fund.info.count
    }
    
    func configure(cell: FundCell) {
        guard let fund = fund else { return }
        cell.configure(title: fund.title, fundName: fund.fundName, whatIs: fund.whatIs, definition: fund.definition, riskTitle: fund.riskTitle, infoTitle: fund.infoTitle, riskIndex: fund.risk)
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
