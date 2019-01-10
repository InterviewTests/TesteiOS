//
//  ProductPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

protocol ProductPresenterDelegate {
    func bindTo(view: ProductViewDelegate)
    func requestInfo()
    func infoForRow(_ row:Int)->Info?
    func downInfoForRow(_ row:Int)->Info?
    func profitabilityForRow(_ row:Int)->Profitability?
    func download()
    func invest()
}

class ProductPresenter: ProductPresenterDelegate{
    
    /// Instance of the Controller's view
    private weak var view:ProductViewDelegate?
    
    /// The Screen model
    var screen:Screen?
    
    /// Returns the number of items that each section of the Controller's list will have
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
    
    /// Returns the numbers of section that the Controller's list will have
    var numberOfSections:Int{
        get{
            return 5
        }
    }
    
    /// Binds the Presenter to the view
    func bindTo(view: ProductViewDelegate) {
        self.view = view
    }
    
    /// Requests the screen information
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
    
    /// Returns an Info object for a given index
    func infoForRow(_ row:Int)->Info?{
        return screen?.info?[row]
    }
    
    /// Returns a downInfo object for a given index
    func downInfoForRow(_ row:Int)->Info?{
        return screen?.downInfo?[row]
    }
    
    /// Returns a Profitability object for a given index
    func profitabilityForRow(_ row:Int)->Profitability?{
        return screen?.profitabilities[row]
    }
    
    /// Notifies the view that the action "Baixar" was clicked
    func download(){
        view?.openWebView(site: "https://www.google.com")
    }
    
    /// Notifies the view that the button "Invest" was clicked
    func invest(){
        view?.displayPopup(title: screen?.fundName ?? "Investimento", message: "Investimento realizado")
    }
}
