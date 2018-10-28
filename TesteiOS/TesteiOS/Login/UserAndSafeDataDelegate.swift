//
//  UserAndSafeDataDelegate.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 21/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

struct Credentials {
    var username: String
    var password: String
}

protocol UserAndSafeDataDelegate {
    func isValidPassword(input: String) -> Bool
    func isValidEmail(email: String) -> Bool
    func isValidCPF(cpfInput: String) -> Bool
}

extension UserAndSafeDataDelegate {

    func isValidPassword(input: String) -> Bool {
        //guard input.count > 8 else { return false }
        let setOfUppercase: CharacterSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let setOfNumbersAndAlpha = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz0123456789")
        let setOfUpperNormalandNumbers = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if input.rangeOfCharacter(from: setOfUpperNormalandNumbers.inverted) == nil {
            return false
        } else if input.rangeOfCharacter(from: setOfUppercase) == nil {
            return false
        } else if input.rangeOfCharacter(from: setOfNumbersAndAlpha) == nil {
            return false
        } else {
            return true
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidCPF(cpfInput: String) -> Bool {
        let numbers = cpfInput.filter { "0123456789".contains($0) }
        if numbers.count < 11 {
            return false
        } else {
            return true
        }
    }
   
    @discardableResult
    func saveKeys(credentials: Credentials) throws -> OSStatus? {
        guard let encodedPassword = credentials.password.data(using: String.Encoding.utf8) else { return nil }
        let queryCredentials: [String: Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : credentials.username,
            kSecAttrService as String: "SantanderTest",
            kSecValueData as String : encodedPassword
        ]
        
        SecItemDelete(queryCredentials as CFDictionary)
        
        let status = SecItemAdd(queryCredentials as CFDictionary, nil)
        guard status == errSecSuccess else { throw KeychainError.unhandledError(status: status) }
        return status
    }
    
    func loadKeys(credentials: String) -> Credentials? {

        var passwordData: AnyObject?
        var returnString: String
        let queryCredentials: [String: Any] = [
            kSecClass as String : kSecClassGenericPassword,
            kSecAttrAccount as String : credentials,
            kSecReturnData as String : kCFBooleanTrue,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]
        let status: OSStatus = SecItemCopyMatching(queryCredentials as CFDictionary, &passwordData)
        
        if status == noErr {
            if let retrievedData = passwordData as? Data {
                returnString = String(data: retrievedData, encoding: String.Encoding.utf8)!
                return Credentials(username: credentials, password: returnString)
            }
        }
        return nil
    }
}
