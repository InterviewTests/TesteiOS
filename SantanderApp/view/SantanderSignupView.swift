//
//  SantanderSignupView.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 26/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderSignupView: UIView {
    
    @IBOutlet weak var stackView: SantanderSignupStackView!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var signupMessage: UILabel!
    
    @IBOutlet weak var buttonSend: UIButton!
    var signed : Bool = false

    func stackViewAdd(uiView: UIView){
        self.stackView.addArrangedSubview(uiView)
    }
    @IBAction func didTouchSignup(_ sender: Any) {
        
        if(!self.signed){
            let signed = UIImage(named: "signup_clicked")
            self.signed = true
            self.signupButton.setImage(signed, for: .normal)
        }else{
            self.signed = false
            let signed = UIImage(named: "signup")
            self.signupButton.setImage(signed, for: .normal)
        }
        
        
    }
    
}

