//
//  CustomButton.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit
@IBDesignable
class CustomButton: UIButton {
    var status:Bool = false
    func disableButton(){
        self.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.462745098, blue: 0.462745098, alpha: 1)
    }
    
    func usedButton(){
        self.status = !status

        if status{
            self.disableButton()
        }else{
            self.enableButton()
        }
    }
    
    func enableButton(){
        self.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
    }
    
}
