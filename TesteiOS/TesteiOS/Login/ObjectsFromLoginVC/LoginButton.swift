//
//  LoginButton.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 20/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import UIKit

class LoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Login", for: .normal)
        self.backgroundColor = UIColor.spc_from(r: 59, g: 72, b: 238)
        self.layer.cornerRadius = 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
