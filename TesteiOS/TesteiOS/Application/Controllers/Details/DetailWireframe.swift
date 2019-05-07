//
//  DetailWireframe.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

class DetailWireframe {
    
    var interactor:DetailInteractor?
    
    static func configurate(viewcontroller:DetailViewController) {
        
        let presenter  = DetailPresenter()
        let wireframe  = DetailWireframe()
        let interactor = DetailInteractor(presenter: presenter, wireframe: wireframe)
        
        viewcontroller.interactor = interactor
        interactor.presentOutput  = presenter
        presenter.output          = viewcontroller
        
    }
}
