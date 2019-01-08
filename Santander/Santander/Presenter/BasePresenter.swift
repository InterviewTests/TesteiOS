//
//  BasePresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 08/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

class BasePresenter<T>{
    
    var view:T?
    
    ///
    init(bindTo view:T) {
        self.view = view
    }
    
    ///
    func destroy(){
        view = nil
    }
}
