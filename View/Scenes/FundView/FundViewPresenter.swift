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

protocol FundView: BasicView {
    func refresh()
    func goToFundDetails()
}

protocol FundViewPresenter: BasicPresenter {
    func getRowCount() -> Int
    func configure(cell: FundViewCell, at row: Int)
    
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
        
    }

    // MARK: Presenter functions
    func getRowCount() -> Int {
        guard let fund = fund else { return 0 }
        return 1 + fund.downInfo.count + fund.info.count
    }
    
    func configure(cell: FundViewCell, at row: Int) {
//        guard row >= 0 else { return }
//        guard row < list.count else { return }
        
    }

}
