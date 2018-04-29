//
//  BuilderInterface.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 28/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import Foundation
import UIKit

protocol BuilderInterface{
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView)
    
}

class SantanderPhoneViewBuilder: BuilderInterface{
    
    static let sharedInstance = SantanderPhoneViewBuilder()
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) {
        let santViewCell = SantanderRoute.instanceSantanderPhoneTypeFieldFromNib()
        santViewCell.label.text = formCell.message! as String
        santViewCell.tag = formCell.id!

        signUpView.stackViewAdd(uiView: santViewCell)
        
    }
    
}

class SantanderEmailViewBuilder: BuilderInterface{
    
    static let sharedInstance = SantanderEmailViewBuilder()
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) {
        let santViewCell = SantanderRoute.instanceSantanderEmailTypeFieldFromNib()
        santViewCell.label.text = formCell.message! as String

        if formCell.hidden! {
            santViewCell.isUserInteractionEnabled = false
        }
        santViewCell.tag = formCell.id!
        signUpView.stackViewAdd(uiView: santViewCell)
        
    }
}

class SantanderTextViewBuilder: BuilderInterface{
    
    static let sharedInstance = SantanderTextViewBuilder()
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) {
        let santViewCell = SantanderRoute.instanceSantanderTextTypeFieldFromNib()
        santViewCell.nameLabel.text = formCell.message!
        santViewCell.tag = formCell.id!
        signUpView.stackViewAdd(uiView: santViewCell)
        
        
    }
}
class SantanderCheckButtonViewBuilder: BuilderInterface{
    
    static let sharedInstance = SantanderCheckButtonViewBuilder()
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) {
        
        signUpView.signupMessage.text = formCell.message

        
    }
}

