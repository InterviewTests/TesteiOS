//
//  MainWorker.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

class MainWorker {
    let manager: NetworkManager
    
    init(manager: NetworkManager = NetworkManager()) {
        self.manager = manager
    }
    
    func getFund(success: @escaping (_ fund: FundModel) -> (),
                 failure: @escaping (_ error: NetworkResponse) -> ()) {
        manager.request(request: InvestmentAPI.fund, success: { (screen: ScreenModel) in
            success(screen.screen)
        }) { (error) in
            failure(error)
        }
    }
}
