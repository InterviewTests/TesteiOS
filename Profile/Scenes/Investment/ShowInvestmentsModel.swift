//
//  ShowInvestmentsModel.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

enum ShowInvestment
{
    // MARK: Use cases
    
    enum GetInvestment
    {
        struct Response
        {
            
        }
        
        struct ViewModel
        {
            struct DisplayedInvestment
            {
                var screenTitle:String
                var investmentFundName:String
                var whatIs:String
                var definition:String
                var riskTitle:String
                var risk: String
                var infoTitle:String
                var monthlyFundValue:Double
                var monthlyCDIValue:Double
                var yearFundValue:Double
                var yearCDIValue:Double
                var accumulatedFundValue:Double
                var accumulatedCDIValue:Double
                var investmentInfo: [String]
                var downloadInfo: [String]
            }
            var displayedInvestment: DisplayedInvestment
        }
    }
}
