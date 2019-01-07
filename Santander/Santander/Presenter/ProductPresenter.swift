//
//  ProductPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

class ProductPresenter{
    
    private var view:ProductViewDelegate?
    
    ///
    init(bindTo view:ProductViewDelegate) {
        self.view = view
    }
    
    ///
    func destroy(){
        view = nil
    }
    
    ///
    func requestInfo(){
        RequestService().productDetail().responseJSON { [weak self] response in
            if let data = response.data{
                if let root = try? JSONDecoder().decode(Root.self, from: data), let items = root.cells{
                    self?.view?.updateTableViewItems(items: items)
                }
            }
        }
    }
    
    func share(){
        
    }
    
    func download(){
        
    }
    
    func invest(){
        
    }
}
