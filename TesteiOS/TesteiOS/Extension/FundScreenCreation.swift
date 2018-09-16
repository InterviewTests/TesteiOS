//
//  FundScreenCreation.swift
//  TesteiOS
//
//  Created by Nicolau on 16/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import Foundation

extension FundVC {
    func createLayout(from screen: Screen) {
        titleLabel.text = screen.title
        fundNameLabel.text = screen.fundName
        whatIsLabel.text = screen.whatIs
        definitionLabel.text = screen.definition
        riskTitleLable.text = screen.riskTitle
        
        riskView.riskLevel = screen.risk
        
        infoTitleLabel.text = screen.infoTitle
        
        monthFundLabel.text = "\(screen.moreInfo.month.fund)%"
        monthCDILabel.text = "\(screen.moreInfo.month.CDI)%"
        
        yearFundLabel.text = "\(screen.moreInfo.year.fund)%"
        yearCDILabel.text = "\(screen.moreInfo.year.CDI)%"
        
        _12MonthFundLabel.text = "\(screen.moreInfo._12months.fund)%"
        _12MonthCDILabel.text = "\(screen.moreInfo._12months.CDI)%"
    }
}
