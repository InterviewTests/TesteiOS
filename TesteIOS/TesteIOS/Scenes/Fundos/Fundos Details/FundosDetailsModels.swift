//
//  FundosDetailsModels.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

enum FundosDetails {
    enum GetFund {
        struct Request {
        }
        
        struct Response {
            var fundo: FundModel?
            var error: FundosStoreError?
        }
        
        struct ViewModel {
            struct DisplayedFundPeriodInfo{
                let fund: Double
                let cdi: Double
            }
            
            struct DisplayedFundMoreInfo {
                let month: DisplayedFundPeriodInfo
                let year: DisplayedFundPeriodInfo
                let twelveMonths: DisplayedFundPeriodInfo
            }
            
            struct DisplayedFundInfo {
                let name: String
                let data: String
            }
            
            struct DisplayedFund {
                var title: String
                var fundName: String
                var whatIs: String
                var definition: String
                var riskTitle: String
                var risk: Int
                var infoTitle: String
                
                var moreInfo: DisplayedFundMoreInfo
                var info: [DisplayedFundInfo]
                var downInfo: [DisplayedFundInfo]
            }
            
            var displayedFund: DisplayedFund?
            var error: FundosStoreError?
        }
    }
}
