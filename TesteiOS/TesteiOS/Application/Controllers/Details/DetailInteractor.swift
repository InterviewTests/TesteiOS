//
//  DetailInteractor.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

protocol DetailInteractorInput: class {
    func loadDetail()
}

protocol DetailInteractorOutput: class {
    func resultDetail(sectionScreen:[SectionScreens])
    func failure(msg:String)
}

class DetailInteractor: NSObject, DetailInteractorInput {
    
    private(set) var presenter : DetailPresenter
    private(set) var wireframe : DetailWireframe
    
    weak var presentOutput: DetailInteractorOutput?
    
    init(presenter:DetailPresenter, wireframe:DetailWireframe) {
        self.presenter = presenter
        self.wireframe = wireframe
    }
    
    private lazy var provider : DetailProvider = {
        return DetailProvider.init()
    }()
    
    //MARK: DetailInteractorInput
    func loadDetail() {
        self.provider.getDetails { (baseClass, error) in
            guard error == nil else {
                self.presentOutput?.failure(msg: error!.localizedDescription)
                return
            }
            
            if let baseClass = baseClass, let screen = baseClass.screen {
                
                var sectionScreens:[SectionScreens] = [SectionScreens]()
                var nameFund:FundName?
                var what:WhatIs?
                var riskScreen:RiskScreen?
                var moreInfo:MoreInformation?
                
                //FUND NAME
                if let title = screen.title, let fundName = screen.fundName {
                    nameFund = FundName(title: title, name: fundName)
                    sectionScreens.append(SectionScreens(fundName: nameFund!, whatId: nil, riskScreen: nil, moreInformation: nil, info: nil, downInfo: nil))
                }
                
                //WHAT IS
                if let whatIs = screen.whatIs, let definition = screen.definition {
                    what = WhatIs(title: whatIs, definition: definition)
                    sectionScreens.append(SectionScreens(fundName: nil, whatId: what!, riskScreen: nil, moreInformation: nil, info: nil, downInfo: nil))
                }
                
                //RISK SCREEN
                if let titleRisk = screen.riskTitle, let risk = screen.risk {
                    riskScreen = RiskScreen(title: titleRisk, risk: risk)
                    sectionScreens.append(SectionScreens(fundName: nil, whatId: nil, riskScreen: riskScreen, moreInformation: nil, info: nil, downInfo: nil))
                }
                
                //MORE INFORMATION
                if let titleMore = screen.infoTitle, let infoM = screen.moreInfo {
                    moreInfo = MoreInformation(title: titleMore, more: infoM)
                    sectionScreens.append(SectionScreens(fundName: nil, whatId: nil, riskScreen: nil, moreInformation: moreInfo, info: nil, downInfo: nil))
                }
                
                //INFO
                if let info = screen.info {
                    sectionScreens.append(SectionScreens(fundName: nil, whatId: nil, riskScreen: nil, moreInformation: nil, info: info, downInfo: nil))
                }
                
                //DOWNINFO
                if let downInfo = screen.downInfo {
                    sectionScreens.append(SectionScreens(fundName: nil, whatId: nil, riskScreen: nil, moreInformation: nil, info: nil, downInfo: downInfo))
                }
                
                
                self.presentOutput?.resultDetail(sectionScreen: sectionScreens)
            }
        }
    }
    
}
