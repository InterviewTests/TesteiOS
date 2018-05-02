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
    var signedIcon : Bool = false
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        self.signed = false
        self.signedIcon = false
    }
    func stackViewAdd(uiView: UIView){
        self.stackViewHeight.constant += uiView.frame.height
        
        if(uiView.tag == 4){
            signed = true
            self.stackView.insertArrangedSubview(uiView, at: 1)

        }else{
            self.stackView.addArrangedSubview(uiView)
        }
        uiView.heightAnchor.constraint(equalToConstant: 76).isActive = true
        self.stackView.layoutIfNeeded()

    }
    
    func stackViewRemove(tag: Int){
        let uiView = self.stackView.viewWithTag(tag)
        if(tag == 4){
            signed = false
        }
        self.stackViewHeight.constant -= uiView!.frame.height

        self.stackView.removeArrangedSubview(uiView!)
        self.stackView.layoutIfNeeded()
        self.stackView.layoutSubviews()
        uiView!.removeFromSuperview()
    }
    @IBAction func didTouchSignup(_ sender: Any) {
        
        if(!self.signedIcon){
            let signed = UIImage(named: "signup_clicked")
            self.signedIcon = true
            self.signupButton.setImage(signed, for: .normal)
        }else{
            self.signedIcon = false
            let signed = UIImage(named: "signup")
            self.signupButton.setImage(signed, for: .normal)
        }
        
        
    }
    
}

