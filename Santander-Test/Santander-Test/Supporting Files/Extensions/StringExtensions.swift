//
//  StringExtensions.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 20/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

extension String {
    func convertToPhoneNumberFormat() -> String? {
        var text = self.replacingOccurrences(of: "(", with: "")
        text = text.replacingOccurrences(of: ")", with: "")
        text = text.replacingOccurrences(of: "-", with: "")
        text = text.replacingOccurrences(of: " ", with: "")
        
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", "^[0-9]*$")
        
        guard numberPredicate.evaluate(with: text) else { return nil }
        
        let textLenght = text.count
        
        switch textLenght {
        case 1, 2:
            return "(\(text)"
        case 3, 4, 5, 6, 7:
            return "(\(text.prefix(2))) \(text.suffix(textLenght - 2))"
        case 8, 9:
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: 7 - textLenght)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(textLenght - 7))"
        case 10, 11:
            let start = text.index(text.startIndex, offsetBy: 2)
            let end = text.index(text.endIndex, offsetBy: -4)
            let range = start..<end
            return "(\(text.prefix(2))) \(text[range])-\(text.suffix(4))"
        default:
            return "\(self.prefix(15))"
        }
    }
}
