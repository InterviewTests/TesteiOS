//
//  FundModels.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

enum Funds {
    enum FetchFunds {
        struct Request {
        }
        struct Response {
            var funds: [Fund]
        }
        struct ViewModel {
            struct DisplayedFund {
                var title: String
                var fundName: String
                var whatIs: String
                var definition: String
                var riskTitle: String
                var risk: Int
                var infoTitle: String
                var moreInfo: DisplayedMoreInfo
                var info: [DisplayedInfo]
                var downInfo: [DisplayedInfo]
            }
            var displayedFunds: [DisplayedFund]
            
            struct DisplayedMoreInfo {
                var month: DisplayedMonth
                var year: DisplayedYear
                var twelveMonths: DisplayedTwelveMonths
            }
            
            struct DisplayedMonth {
                var fund: Double
                var cdi: Double
            }
            
            struct DisplayedYear {
                var fund: Double
                var cdi: Double
            }
            
            struct DisplayedTwelveMonths {
                var fund: Double
                var cdi: Double
            }
            
            struct DisplayedInfo {
                var name: String
                var data: String?
            }
        }
    }
}
