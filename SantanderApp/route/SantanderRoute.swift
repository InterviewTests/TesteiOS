//
//  SantanderRoute.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 26/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderRoute: NSObject {

    class func instanceSantanderEmailTypeFieldFromNib() -> SantanderEmailTypeField {
        
        return UINib(nibName: "SantanderEmailTypeField", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SantanderEmailTypeField
    }
    class func instanceSantanderTextTypeFieldFromNib() -> SantanderNameTextField {
        
        return UINib(nibName: "SantanderNameTextField", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SantanderNameTextField
    }
    
    class func instanceSantanderPhoneTypeFieldFromNib() -> SantanderPhoneTextField {
        
        return UINib(nibName: "SantanderPhoneTextField", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! SantanderPhoneTextField
    }
    
    class func instanceSantanderFundViewController() -> SantanderFundViewController{
        let storyboard = UIStoryboard(name: "santanderapp", bundle: nil)
        let fundViewController = storyboard.instantiateViewController(withIdentifier: "SantanderFundViewController") as! SantanderFundViewController
        return fundViewController
    }
}
