//
//  UserTextField.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 20/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit

class UserTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.placeholder = " User"
        self.layer.borderWidth = 0.25
        self.layer.cornerRadius = 3
        self.autocorrectionType = .no
        self.returnKeyType = .next
        if #available(iOS 10.0, *) {
            if #available(iOS 11.0, *) {
                self.textContentType = UITextContentType.username
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
