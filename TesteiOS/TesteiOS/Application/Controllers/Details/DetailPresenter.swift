//
//  DetailPresenter.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol DetailPresenterProtocol: class {
    func loadDetail(screen:Screen)
    func failureView(msg:String)
}

class DetailPresenter: NSObject, DetailInteractorOutput {
    
    weak var output: DetailPresenterProtocol?
    
    //MARK: DetailInteractorOutput
    func resultDetail(screen:Screen) {
        self.output?.loadDetail(screen: screen)
    }
    
    func failure(msg:String) {
        self.output?.failureView(msg: msg)
    }
    
}
