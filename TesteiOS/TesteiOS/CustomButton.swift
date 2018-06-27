//
//  CustomButton.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/26/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit

class CustomButton : UIButton {
    
    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 25
        self.titleLabel!.textAlignment = .center
        self.backgroundColor = UIColor.hexStringToUIColor(hex: "D61221")
        self.frame.size.height = 50.0
        self.frame.size.width = 315.0
        self.setTitleColor(.white, for: .normal)
        
        
    }
    
    
}

