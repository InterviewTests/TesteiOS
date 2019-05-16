//
//  DetailPresenter.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol DetailPresenterProtocol: class {
    func loadDetail(sectionScreen:[SectionScreens])
    func failureView(msg:String)
}

class DetailPresenter: NSObject, DetailInteractorOutput {
    
    weak var output: DetailPresenterProtocol?
    
    //MARK: DetailInteractorOutput
    func resultDetail(sectionScreen:[SectionScreens]) {
        self.output?.loadDetail(sectionScreen: sectionScreen)
    }
    
    func failure(msg:String) {
        self.output?.failureView(msg: msg)
    }
    
}
