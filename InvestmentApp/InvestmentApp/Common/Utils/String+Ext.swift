//
//  String+Ext.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
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
            "(\\d{0})",
            "(\\d{1})",
            "(\\d{2})",
            "(\\d{2}) (\\d{1})",
            "(\\d{2}) (\\d{2})",
            "(\\d{2}) (\\d{3})",
            "(\\d{2}) (\\d{4})",
            "(\\d{2}) (\\d{5})",
            "(\\d{2}) (\\d{6})",
            "(\\d{2}) (\\d{7})",
            "(\\d{2}) (\\d{8})",
            "(\\d{2}) (\\d{5})-(\\d{4})"
        ]
        var text = self.onlyNumbers().trunc(length: 11)
        
        let regexIndex = text.count
        if text.count > 1 {
            let regexUsed = regexMap[regexIndex]
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
}
