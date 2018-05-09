//
//  FundPresender.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation

protocol FundProtocol:BaseView {

    func updateWithLoadedFunds()
}

class FundPresender: BasePresenter {
    var view: FundProtocol
    var service: FundService
    
    typealias V = FundProtocol
    typealias S = FundService
    
    var screenFunds:Screen!
    
    var numberOfItems:Int{
        guard let screenFunds = screenFunds else{ return 0}
        return 4 + screenFunds.screen.info.count + screenFunds.screen.downInfo.count
    }
    
    var numberOfItemsForInfo:Int{
       return screenFunds.screen.info.count
    }
    
    init(service:FundService,view:FundProtocol) {
        self.service = service
        self.view = view
    }
    
    func getInfo(for index:Int)->Info{
        return self.screenFunds.screen.info[index - 4]
    }
    func getDownInfo(for index:Int)->Info{
        return self.screenFunds.screen.downInfo[index - self.screenFunds.screen.info.count - 4] 
    }
    func loadFunds(){
        view.showLoading()
        service.load { (result) in
            self.view.hideLoading()
            switch result{
            case .success(let statusCode,let screen):
                print(screen,statusCode)
                self.screenFunds = screen
                self.view.updateWithLoadedFunds()
            case .error(let error):
                print(error)
                self.view.showDefaultError()
            }
        }
    }
    
    
}
