//
//  SantanderTextViewBuilder.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 29/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderTextViewBuilder: BuilderInterface {
    static let sharedInstance = SantanderTextViewBuilder()
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) -> UIView{
        let santViewCell = SantanderRouter.instanceSantanderTextTypeFieldFromNib()
        santViewCell.nameLabel.text = formCell.message!
        santViewCell.tag = formCell.id!
        signUpView.stackViewAdd(uiView: santViewCell)
        return santViewCell
    }
}
