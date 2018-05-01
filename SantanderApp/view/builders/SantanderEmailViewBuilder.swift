//
//  SantanderEmailViewBuilder.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 29/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderEmailViewBuilder: BuilderInterface {
    static let sharedInstance = SantanderEmailViewBuilder()
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) {
        let santViewCell = SantanderRouter.instanceSantanderEmailTypeFieldFromNib()
        santViewCell.label.text = formCell.message! as String
        
        if formCell.hidden! {
            santViewCell.isUserInteractionEnabled = false
//            santViewCell.label.textColor = UIColor.cy
        }
        santViewCell.tag = formCell.id!
        signUpView.stackViewAdd(uiView: santViewCell)
        
    }
}
