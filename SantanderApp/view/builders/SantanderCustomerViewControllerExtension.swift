//
//  SantanderCustomerViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 28/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import Foundation
protocol SantanderDelegate {
    func createView(formCell: CellEntity)
}
extension SantanderCustomerViewController{
    func createView(formCell: CellEntity){
        switch formCell.id!{
            case 2: createTextForm(formCell: formCell)
            case 4: createEmailForm(formCell: formCell)
            case 6: createPhoneForm(formCell: formCell)
            case 3: createCheckBox(checkCell: formCell)
            default: break
        }
        
    }
    
    func createPhoneForm(formCell: CellEntity){
        
        let santanderPhoneViewBuilder = SantanderPhoneViewBuilder.sharedInstance
        santanderPhoneViewBuilder.buildView(formCell: formCell, signUpView: self.stSignView)
        
    }
    
    func createTextForm(formCell: CellEntity){
        
        let santanderTextViewBuilder = SantanderTextViewBuilder.sharedInstance
        santanderTextViewBuilder.buildView(formCell: formCell, signUpView: self.stSignView)
        
    }
    func createEmailForm(formCell: CellEntity){
        
        let santanderEmailViewBuilder = SantanderEmailViewBuilder.sharedInstance
        santanderEmailViewBuilder.buildView(formCell: formCell, signUpView: self.stSignView)
    }
    
    func createCheckBox(checkCell: CellEntity){
        let santanderCheckBoxBuilder = SantanderCheckButtonViewBuilder.sharedInstance
        santanderCheckBoxBuilder.buildView(formCell: checkCell, signUpView: self.stSignView)
//        self.stSignView.signupMessage.text = checkCell.message!
    }
    
    func unHidePhoneForm(){
//        self.stSignView.stackView.viewWithTag(<#T##tag: Int##Int#>)
    }
    
}

