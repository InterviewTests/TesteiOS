//
//  FundosWorker.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

class FundosWorker {
    var fundosStore: FundosStoreProtocol
    
    init(fundosStore: FundosStoreProtocol) {
        self.fundosStore = fundosStore
    }
    
    func fetchFundo(completionHandler: @escaping(FundModel?, FundosStoreError?) -> Void) {
        fundosStore.fetchFundo { (fund, error) in
            completionHandler(fund, error)
        }
    }
}

protocol FundosStoreProtocol {
    func fetchFundo(completionHandler: @escaping(FundModel?, FundosStoreError?) -> Void)
}

enum FundosStoreError: Error {
    case CannotFetch(String)
}
