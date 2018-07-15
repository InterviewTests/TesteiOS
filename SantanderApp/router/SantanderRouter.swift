//
//  SantanderRoute.swift
//  SantanderApp
//
//  Created by Andre Nogueira 
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderRouter: NSObject {

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
    
    class func instanceFinishedViewController() -> UIViewController{
        let storyboard = UIStoryboard(name: "santanderapp", bundle: nil)
        let finished = storyboard.instantiateViewController(withIdentifier: "FinishedID")
        return finished
    }
}
