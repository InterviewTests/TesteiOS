//
//  String+Extension.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
extension String {
    var html2AttributedString: NSMutableAttributedString? {
        guard
            let data = data(using: String.Encoding.utf8)
            else { return nil }
        do {
            return try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func getLastAddress() -> String {
        let exploded = self.components(separatedBy: "/")
        if let last = exploded.last {
            return last
        }
        return ""
    }
    
    func telephoneMask() -> String {
        let regexMap = [
            "(\\d{1})",
            "(\\d{2})",
            "\\((\\d{2})\\) (\\d{1})",
            "\\((\\d{2})\\) (\\d{2})",
            "\\((\\d{2})\\) (\\d{3})",
            "\\((\\d{2})\\) (\\d{4})",
            "\\((\\d{2})\\) (\\d{5})",
            "\\((\\d{2})\\) (\\d{6})",
            "\\((\\d{2})\\) (\\d{7})",
            "\\((\\d{2})\\) (\\d{4})-(\\d{4})",
            "\\((\\d{2})\\) (\\d{5})-(\\d{4})"
        ]
        var text = self.onlyNumbers().trunc(length: 11)
        
        let regexIndex = text.count
        if text.count > 1 {
            let regexUsed = regexMap[regexIndex - 1]
            text = NSStringMask.maskString(text, withPattern: regexUsed)
        }
        return text
    }
    
    func onlyNumbers() -> String {
        let stringArray = self.components(
            separatedBy: NSCharacterSet.decimalDigits.inverted)
        let newString = stringArray.joined(separator: "")
        
        return newString
    }
    
    func trunc(length: Int) -> String {
        if self.count > length {
            let index = self.index(self.startIndex, offsetBy: length)
            return String(self[..<index])
        }
        return self
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
