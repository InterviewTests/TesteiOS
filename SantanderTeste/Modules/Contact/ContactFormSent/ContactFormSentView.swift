//
//  ContactFormSentView.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 14/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class ContactFormSentView: UIView {
    
    var onRessendPressed: (() -> Void)?
    
    @IBAction private func reesend() {
        onRessendPressed?()
    }
}
