//
//  ContactPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 05/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

class ContactPresenter{
    
    ///
    private weak var view:ContactViewDelegate?
    
    private var items:[FormItem] = []
    
    ///
    var numberOfItems:Int {
        get{
            return items.count
        }
    }
    
    ///
    func bindTo(view: ContactViewDelegate) {
        self.view = view
    }
    
    ///
    func destroy() {
        self.view = nil
    }
    
    ///
    func sendContact(){
        view?.showSuccessPage()
    }
    
    ///
    func returnToContactForm(){
        view?.hideSuccessPage()
    }
    
    ///
    func requestForm(){
        RequestService().formList().responseJSON { [weak self] response in
            if let data = response.data{
                if let root = try? JSONDecoder().decode(Root.self, from: data), let items = root.cells{
                    self?.items = items
                    self?.view?.updateTableViewItems(items: items)
                }
            }
        }
    }
    
    ///
    func itemForRow(_ row:Int)->FormItem{
        return items[row]
    }
    
    ///
    func onSwitchSelected(_ isSelected:Bool, _ item:FormItem){
        
    }
}
