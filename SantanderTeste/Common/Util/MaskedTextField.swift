//
//  MaskedTextField.swift
//  CheckinCheckout
//
//  Created by Rafael Macito on 02/02/2018.
//  Copyright © 2018 Madeinweb. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class MaskedTextField: SkyFloatingLabelTextField {
    
    private var _mask: String?
    
    @IBInspectable public var maskString: String? {
        get {
            return _mask
        }
        set {
            _mask = newValue
        }
    }
    
    func applyFilter(textField: UITextField) {
        guard let mask = _mask else { return }
        
        var index = mask.startIndex
        var textWithMask: String = ""
        var i: Int = 0
        var text: String = textField.text!
        
        if text.isEmpty {
            return
        }
        
        text = removeMaskCharacters(text: text, withMask: mask)
        
        while index != mask.endIndex {
            if i >= text.count {
                self.text = textWithMask
                break
            }
            
            if "\(mask[index])" == "N" {
                if !isNumber(textToValidate: text[i]) {
                    break
                }
                
                textWithMask += text[i]
                i += 1
            } else if "\(mask[index])" == "C" {
                if hasSpecialCharacter(searchTerm: text[i]) {
                    break
                }
                
                if isNumber(textToValidate: text[i]) {
                    break
                }
                
                textWithMask += text[i].uppercased()
                i += 1
            } else if "\(mask[index])" == "c" {
                if hasSpecialCharacter(searchTerm: text[i]) {
                    break
                }
                
                if isNumber(textToValidate: text[i]) {
                    break
                }
                
                textWithMask += text[i].lowercased()
                i += 1
            } else if "\(mask[index])" == "X" {
                if hasSpecialCharacter(searchTerm: text[i]) {
                    break
                }
                
                if isNumber(textToValidate: text[i]) {
                    break
                }
                
                textWithMask += text[i]
                i += 1
            } else if "\(mask[index])" == "%" {
                if hasSpecialCharacter(searchTerm: text[i]) {
                    break
                }
                
                textWithMask += text[i]
                i += 1
            } else if "\(mask[index])" == "U" {
                if hasSpecialCharacter(searchTerm: text[i]) {
                    break
                }
                
                textWithMask += text[i].uppercased()
                i += 1
            } else if "\(mask[index])" == "u" {
                if hasSpecialCharacter(searchTerm: text[i]) {
                    break
                }
                
                textWithMask += text[i].lowercased()
                i += 1
            } else if "\(mask[index])" == "*" {
                textWithMask += text[i]
                i += 1
            } else {
                textWithMask += "\(mask[index])"
            }

            index = mask.index(after: index)
        }
        
        self.text = textWithMask
    }
    
    public func isNumber(textToValidate: String) -> Bool {
        let num = Int(textToValidate)
        
        if num != nil {
            return true
        }
        
        return false
    }
    
    func hasSpecialCharacter(searchTerm: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options()) else {
            return false
        }
        
        if regex.firstMatch(in: searchTerm, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: searchTerm.count)) != nil {
            return true
        }
        
        return false
    }
    
    public func removeMaskCharacters(text: String, withMask mask: String) -> String {
        var mask = mask
        var text = text
        
        mask = mask.replacingOccurrences(of: "X", with: "")
        mask = mask.replacingOccurrences(of: "N", with: "")
        mask = mask.replacingOccurrences(of: "C", with: "")
        mask = mask.replacingOccurrences(of: "c", with: "")
        mask = mask.replacingOccurrences(of: "U", with: "")
        mask = mask.replacingOccurrences(of: "u", with: "")
        mask = mask.replacingOccurrences(of: "*", with: "")
        
        var index = mask.startIndex
        
        while index != mask.endIndex {
            text = text.replacingOccurrences(of: "\(mask[index])", with: "")
            index = mask.index(after: index)
        }
        
        return text
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        applyFilter(textField: textField)
    }
}

extension String {
    
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(start, offsetBy: r.upperBound - r.lowerBound)
        return String(self[(start ..< end)])
    }
}
