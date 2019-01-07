//
//  ContactPresenter.swift
//  Santander
//
//  Created by Jonathan Martins on 05/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

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
