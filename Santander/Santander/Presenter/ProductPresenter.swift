//
//  ProductPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

class ProductPresenter{
    
    ///
    private weak var view:ProductViewDelegate?
    
    ///
    var screen:Screen?
    
    ///
    func numberOfItems(in section:Int)->Int{
        if(section == 1){
            return screen?.profitabilities.count ?? 0
        }
        else if(section == 2){
            return screen?.info?.count ?? 0
        }
        else if(section == 3){
            return screen?.downInfo?.count ?? 0
        }
        else{
             return 1
        }
    }
    
    ///
    var numberOfSections:Int{
        get{
            return 5
        }
    }
    
    ///
    func bindTo(view: ProductViewDelegate) {
        self.view = view
    }
    
    ///
    func destroy() {
        self.view = nil
    }
    
    ///
    func requestInfo(){
        RequestService().productDetail().responseJSON { [weak self] response in
            if let data = response.data{
                if let root = try? JSONDecoder().decode(RootScreen.self, from: data), let screen = root.screen{
                    screen.profitabilityToArray()
                    self?.screen = screen
                    self?.view?.updateTableViewItems()
                }
            }
        }
    }
    
    ///
    func infoForRow(_ row:Int)->Info?{
        return screen?.info?[row]
    }
    
    ///
    func downInfoForRow(_ row:Int)->Info?{
        return screen?.downInfo?[row]
    }
    
    ///
    func profitabilityForRow(_ row:Int)->Profitability?{
        return screen?.profitabilities[row]
    }
    
    ///
    func share(){
        
    }
    
    ///
    func download(){
        view?.openWebView(site: "https://www.google.com")
    }
    
    ///
    func invest(){
        print("Investidor")
    }
}
