//
//  ProductPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

class ProductPresenter:BasePresenter<ProductViewDelegate>{
    
    private var items:[FormItem] = []
    
    ///
    var numberOfItems:Int {
        get{
            return items.count
        }
    }
    
    ///
    override init(bindTo view: ProductViewDelegate) {
        super.init(bindTo: view)
    }
    
    ///
    func requestInfo(){
        RequestService().productDetail().responseJSON { [weak self] response in
            if let data = response.data{
                if let root = try? JSONDecoder().decode(Root.self, from: data), let items = root.cells{
                    self?.items = items
                    self?.view?.updateTableViewItems(items)
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
