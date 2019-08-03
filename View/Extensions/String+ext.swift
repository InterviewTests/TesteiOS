//
//  String+ext.swift
//  Platform
//
//  Created by Erika Segatto on 19/03/18.
//  Copyright © 2018 evologica. All rights reserved.
//

import Foundation

func localized(_ string: String) -> String {
    return NSLocalizedString(string, comment: "")
}

extension String {
    
    // MARK: String Conversions
    func asDate() -> Date? {
        if let date = self.asDate(format: "yyyy-MM-dd") {
            return date
        }
        if let date = self.asDate(format: "dd/MM/yyyy") {
            return date
        }
        if let date = self.asDate(format: "yyyy-MM-dd hh:mm:ss") {
            return date
        }//"yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        //"dd/MM/yyyy HH:mm:ss ZZZ"
        return nil
    }
    
    private func asDate(format: String) -> Date? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        return dateFormater.date(from: self)
    }
    
    func asCurrency() -> String {
        let currFormatter = NumberFormatter()
        currFormatter.numberStyle = .currency
        currFormatter.locale = Locale(identifier: "pt_BR")
        currFormatter.currencySymbol = "R$ "
        guard let value = self.asNumber() else { return self }
        return currFormatter.string(from: value) ?? self
    }
    
    func asFloat() -> Float? {
        if let number = self.asNumber() {
            return Float(exactly: number)
        }
        return nil
    }
    
    func asNumber() -> NSNumber? {
        let numFormatter = NumberFormatter()
        numFormatter.decimalSeparator = "."
        if let number = numFormatter.number(from: self){
            return number
        }
        numFormatter.decimalSeparator = ","
        return numFormatter.number(from: self)
    }
    
    
    // MARK: String Format
    func formatAsCpfcnpj() -> String {
        let cleanString = self.formatAsNumeric()
        if cleanString.count > 11 {
            return cleanString.applyMask(mask: "**.***.***/****-**")
        } else {
            return cleanString.applyMask(mask: "***.***.***-**")
        }
    }
    
    func formatAsPhone() -> String {
        let cleanString = self.formatAsNumeric()
        
        switch cleanString.count {
        case 11: return cleanString.applyMask(mask: "(**) *****-****")
        case 9: return cleanString.applyMask(mask: "*****-****")
        case 8: return cleanString.applyMask(mask: "****-****")
        default: return cleanString.applyMask(mask: "****-****")
        }
    }
    
    func formatAsGender() -> String {
        switch self {
        case "F": return "Feminino"
        case "M": return "Feminino"
        default: return self
        }
    }
    
    func formatAsCEP() -> String {
        let cleanString = self.formatAsNumeric()
        return cleanString.applyMask(mask: "**.***-***")
    }
    
    func formatAsNumeric() -> String {
        return self.replacingOccurrences(of:"[^0-9]", with: "", options: .regularExpression)
    }
    
    
    private func applyMask(mask: String) -> String {
        var result = ""
        
        var maskIndex = mask.startIndex
        var selfIndex = self.startIndex
        
        while selfIndex.encodedOffset != self.endIndex.encodedOffset {
            if mask[maskIndex] == "*" {
                result.append(self[selfIndex])
                selfIndex = self.index(after: selfIndex)
            } else {
                result.append(mask[maskIndex])
            }
            maskIndex = mask.index(after: maskIndex)
            if maskIndex.encodedOffset == mask.endIndex.encodedOffset {
                result.append(String(self.suffix(from: selfIndex)))
                return result
            }
        }
        
        return result
    }
    
    // MARK: is Valid
    
    func isValidEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    // MARK: encryption
    
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
//    func sha256() -> String {
//        if let stringData = self.data(using: String.Encoding.utf8) {
//            return hexStringFromData(input: digest(input: stringData as NSData))
//        }
//        return ""
//    }
    
//    private func digest(input: NSData) -> NSData {
//        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
//        var hash = [UInt8](repeating: 0, count: digestLength)
//        CC_SHA256(input.bytes, UInt32(input.length), &hash)
//        return NSData(bytes: hash, length: digestLength)
//    }
    
    private  func hexStringFromData(input: NSData) -> String {
        var bytes = [UInt8](repeating: 0, count: input.length)
        input.getBytes(&bytes, length: input.length)
        
        var hexString = ""
        for byte in bytes {
            hexString += String(format: "%02x", UInt8(byte))
        }
        
        return hexString
    }
}
