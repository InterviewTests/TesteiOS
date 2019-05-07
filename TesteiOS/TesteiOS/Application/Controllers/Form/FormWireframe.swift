//
//  FormWireframe.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation

class FormWireframe {
    
    var interactor:FormInteracor?
    
    static func configurate(viewcontroller:FormViewController) {
        
        let presenter  = FormPresenter()
        let wireframe  = FormWireframe()
        let interactor = FormInteracor(presenter: presenter, wireframe: wireframe)
        
        viewcontroller.interactor = interactor
        interactor.presentOutput  = presenter
        presenter.output          = viewcontroller
        
    }
    
}
