//
//  InvestmentFundsViewModel.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 29/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation

class InvestmentFundsViewModel {
    // MARK: - Model Object
    fileprivate var funds: InvestmentModel
    
    // MARK: - Properties
    fileprivate var infoArrayList: [Info]
    
    // MARK: - Initialization
    init(funds: InvestmentModel) {
        self.funds = funds
        self.infoArrayList = InvestmentFundsViewModel.getInfoArrayList(funds: funds)
    }
    
    // MARK: - Public Methods
    func getTitle() -> String {
        return funds.title
    }
    
    func getFundName() -> String {
        return funds.fundName
    }
    
    func getWhatIs() -> String {
        return funds.whatIs
    }
    
    func getDefinition() -> String {
        return funds.definition
    }
    
    func getRiskTitle() -> String {
        return funds.riskTitle
    }
    
    func getRisk() -> Int {
        return funds.risk
    }
    
    func getMoreInfo() -> MoreInfo {
        return funds.moreInfo
    }
    
    func getInfoItems() -> [Info] {
        return infoArrayList
    }
    
    func getInfoType(info: Info) -> InfoTypeEnum {
        if info.data == nil {
            return .downInfo
        }
        
        return .info
    }
    
    // MARK: - Static Methods
    class func getInfoArrayList(funds: InvestmentModel) -> [Info] {
        var infoArray = [Info]()
        
        for infoItem in funds.info {
            infoArray.append(infoItem)
        }
        
        for downInfoItem in funds.downInfo {
            infoArray.append(downInfoItem)
        }
        
        return infoArray
    }
}
