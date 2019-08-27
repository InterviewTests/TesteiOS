//
//  FundViewControllerMock.swift
//  Tests
//
//  Created by Erika de Almeida Segatto on 26/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Domain
@testable import TesteiOS

class FundViewControllerMock: BasicViewMock, FundView {
    
    private(set) var cell: FundCell? = nil
    private(set) var infoCells = [FundInfoCell]()
    private(set) var downInfoCells = [FundDownInfoCell]()
    var isInFundDetailPage = false
    
    func refresh() { }
    
    func goToFundDetails() {
        isInFundDetailPage = true
    }
    
}

class FundInfoCellMock: FundInfoCell {
    
    private(set) var title: String? = nil
    private(set) var text: String? = nil
    
    func configure(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    
}

class FundDownInfoCellMock: FundDownInfoCell {
    
    private(set) var title: String? = nil
    private(set) var text: String? = nil
    
    func configure(title: String, buttonText: String) {
        self.title = title
        self.text = buttonText
    }
    
    
}

class FundViewCellMock: FundCell {
    
    private(set) var title: String? = nil
    private(set) var fundName: String? = nil
    private(set) var whatIs: String? = nil
    private(set) var definition: String? = nil
    private(set) var riskTitle: String? = nil
    private(set) var riskIndex: Int? = nil
    private(set) var infoTitle: String? = nil
    private(set) var monthInfoFund: String? = nil
    private(set) var monthInfoCdi: String? = nil
    private(set) var yearInfoFund: String? = nil
    private(set) var yearInfoCdi: String? = nil
    private(set) var twelveMonthsFund: String? = nil
    private(set) var twelveMonthsCdi: String? = nil
    
    
    func configure(title: String, fundName: String, whatIs: String, definition: String, riskTitle: String, infoTitle: String, riskIndex: Int, monthInfo: (String, String), yearInfo: (String, String), twelveMonths: (String, String)) {
        self.title = title
        self.fundName = fundName
        self.whatIs = whatIs
        self.definition = definition
        self.riskTitle = riskTitle
        self.riskIndex = riskIndex
        self.infoTitle = infoTitle
        self.monthInfoFund = monthInfo.0
        self.monthInfoCdi = monthInfo.1
        self.yearInfoFund = yearInfo.0
        self.yearInfoCdi = yearInfo.1
        self.twelveMonthsFund = twelveMonths.0
        self.twelveMonthsCdi = twelveMonths.1
    }
    
}
