//
//  ContactPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 05/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

class ContactPresenter{
    
    /// Instance of the ViewCOntrollers'view
    private weak var view:ContactViewDelegate?
    
    /// Controller's datasource
    private var items:[FormItem] = []
    
    /// The number of items that the Controllers'list will have
    var numberOfItems:Int {
        get{
            return items.count
        }
    }
    
    /// Binds the Presenter to the View
    func bindTo(view: ContactViewDelegate) {
        self.view = view
    }
    
    /// Notifies the view to display the succes page if the form is completed filled
    func sendContact(){
        if(isFormCompleted()){
            view?.showSuccessPage()
        }
        else{
            view?.displayPopup(title: "Desculpe", message: "Por favor, preencha todas as informações para continuar.")
        }
    }
    
    /// Validates if the form is fully filled
    private func isFormCompleted() -> Bool{
        var isSuccess = 0
        for item in items{
            if(item.typefield == .email || item.typefield == .telNumber || item.typefield == .text){
                if(item.isSuccess){
                    isSuccess = isSuccess + 1
                }
            }
        }
        return (isSuccess == 3)
    }
    
    /// Notifies the view to hide the success page
    func returnToContactForm(){
        view?.hideSuccessPage()
    }
    
    /// Requests the form information
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
    
    func dismissKeyboard(){

    }
    
    /// Returns an item for a given index
    func itemForRow(_ row:Int)->FormItem{
        return items[row]
    }
    
    /// Notifies the view that the switch was clicked
    func onSwitchSelected(_ isSelected:Bool, _ item:FormItem){
        
    }
}
