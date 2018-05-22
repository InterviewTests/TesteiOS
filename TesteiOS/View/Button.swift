//
//  Button.swift
//  TesteiOS
//
//  Created by Naville Brasil on 15/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation
import UIKit

//Class Customized Button
@IBDesignable class Button: UIButton
{
    @IBInspectable
    var cornerRadius: CGFloat = 0
    {
        didSet
        {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesBegan(touches, with: event)
        self.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.462745098, blue: 0.462745098, alpha: 1)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesEnded(touches, with: event)
        self.backgroundColor = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
    }
}
