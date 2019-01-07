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
        
    }
    
    ///
    func requestForm(){
        RequestService().formList().responseJSON { [weak self] response in
            if let data = response.data{
                if let root = try? JSONDecoder().decode(Root.self, from: data), let items = root.cells{
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
    
}
