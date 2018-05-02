//
//  SantanderCustomerViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 28/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import Foundation

extension SantanderCustomerViewController{
    func createView(formCell: CellEntity){
        switch formCell.id!{
            case 2: createTextForm(formCell: formCell)
            case 6: createPhoneForm(formCell: formCell)
            case 3: createCheckBox(checkCell: formCell)
            default: break
        }
        
    }
    
    func createPhoneForm(formCell: CellEntity){
        
        let santanderPhoneViewBuilder = SantanderPhoneViewBuilder.sharedInstance
        let stPhoneView = santanderPhoneViewBuilder.buildView(formCell: formCell, signUpView: self.stSignView) as! SantanderPhoneTextField
        self.phoneView = stPhoneView
    }
    
    func createTextForm(formCell: CellEntity){
        
        let santanderTextViewBuilder = SantanderTextViewBuilder.sharedInstance
        let stTextView = santanderTextViewBuilder.buildView(formCell: formCell, signUpView: self.stSignView) as! SantanderNameTextField
        self.textView = stTextView
    }
    func createEmailForm(formCell: CellEntity){
        
        let santanderEmailViewBuilder = SantanderEmailViewBuilder.sharedInstance
        let stEmailView = santanderEmailViewBuilder.buildView(formCell: formCell, signUpView: self.stSignView) as! SantanderEmailTypeField
        self.mailView = stEmailView
    }
    
    func createCheckBox(checkCell: CellEntity){
        let santanderCheckBoxBuilder = SantanderCheckButtonViewBuilder.sharedInstance
        santanderCheckBoxBuilder.buildView(formCell: checkCell, signUpView: self.stSignView)
    }
    
}

