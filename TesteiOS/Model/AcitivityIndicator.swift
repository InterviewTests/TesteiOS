//
//  AcitivityIndicator.swift
//  TesteiOS
//
//  Created by Naville Brasil on 22/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class ActivityIndicator
{
    class func startActivity()
    {
        var activityData: ActivityData!
        
        let size = CGSize(width: 40, height: 40)
        let font = UIFont(name: "Avenir Next", size: 17)
        
        activityData = ActivityData(size: size, message: "", messageFont: font, messageSpacing: 0, type: .lineSpinFadeLoader, color: UIColor(red: 255, green: 255, blue: 255, alpha: 1.0), padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    class func stopActivity()
    {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
}
