//
//  Alert.swift
//  TesteiOS
//
//  Created by Naville Brasil on 22/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation
import UIKit

class Alert
{
    class func generateAlert(withTitle title: String, message: String) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
}
