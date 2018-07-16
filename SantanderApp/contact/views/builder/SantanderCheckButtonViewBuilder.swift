//
//  SantanderCheckButtonViewBuilder.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 29/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderCheckButtonViewBuilder: BuilderInterface {

    static let sharedInstance = SantanderCheckButtonViewBuilder()
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) -> UIView{
        
        signUpView.signupMessage.text = formCell.message   
        return UIView()
    }
}
