//
//  ContactPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 05/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation

class ContactPresenter{
    
    private var view:ContactViewDelegate?
    private var items:[FormItem] = []
    
    ///
    init(bindTo view:ContactViewDelegate) {
        self.view = view
    }
    
    ///
    func destroy(){
        view = nil
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
    func isNameValid(name:String?){
        
    }
    
    ///
    func isEmailValid(email:String?){
        
    }
    
    ///
    func isPhoneValid(phone:String?){
        
    }
    
    ///
    func checkSwitch(){
        self.view?.updateTableViewItems()
    }
}
