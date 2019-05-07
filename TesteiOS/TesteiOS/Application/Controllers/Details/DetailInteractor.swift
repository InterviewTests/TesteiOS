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
    func resultDetail(screen:Screen)
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
                self.presentOutput?.resultDetail(screen: screen)
            }
        }
    }
    
}
