//
//  UITextFieldExtension.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setLine(color : UIColor = UIColor.groupTableViewBackground) {
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.masksToBounds = false
        layer.shadowColor   = color.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 1.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius  = 0.0
    }

}

private var textFieldAssociationKey = "textFieldAssociationKey"
extension UITextField {
    private(set) public var textFieldDelegate: UITextFieldDelegate? {
        get { return objc_getAssociatedObject(self, &textFieldAssociationKey) as? UITextFieldDelegate }
        set { objc_setAssociatedObject(self, &textFieldAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN) }
    }
    
    func setMask(mask : String, range : NSRange, string : String)-> Bool {
        
        if !mask.contains("#") { fatalError("Please use # to mask") }
        
        let currentText = (text! as NSString).replacingCharacters(in: range, with: string) as NSString
        let currentMask = (mask  as NSString) as NSString
        
        if currentText.length > currentMask.length {
            return false
        }
        
        let charactersMask = Array(mask)
        
        if charactersMask[range.location] != "#", range.length == 0 {
            if charactersMask[range.location + 1] == " " {
                text?.append(charactersMask[range.location])
                text?.append(charactersMask[range.location + 1])
            }else {
                text?.append(charactersMask[range.location])
            }
        }
        return true
    }
}
