//
//  MainViewModel.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

class MainViewModel {
    var fund: FundModel
    
    init(fund: FundModel) {
        self.fund = fund
    }
    
    func getMoreInfoDetails() -> [InfoDetailModel] {
        var month = fund.moreInfo.month
        month.title = "No mês"
        
        var year = fund.moreInfo.year
        year.title = "No ano"
        
        var twelveMonths = fund.moreInfo.month
        twelveMonths.title = "12 meses"
        return [month, year, twelveMonths]
    }
}
