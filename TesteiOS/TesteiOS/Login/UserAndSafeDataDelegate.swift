//
//  UserAndSafeDataDelegate.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 21/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation

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
        if input.rangeOfCharacter(from: setOfUpperNormalandNumbers) == nil || input.rangeOfCharacter(from: setOfUppercase) == nil || input.rangeOfCharacter(from: setOfNumbersAndAlpha) == nil {
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
    
//    @discardableResult
//    func saveKeys(user: String, pass: String) -> OSStatus {
//        guard let data = pass.data(using: .utf8) else { return errno }
//        let query = [
//            kSecClass as String : kSecClassGenericPassword as String,
//            kSecAttrAccount as String: user,
//            kSecValueData as String : data] as [String: Any]
//
//        SecItemDelete(query as CFDictionary)
//
//        return SecItemAdd(query as CFDictionary, nil)
//    }
    
    func saveKeys(account: String, data: String) {
        if let dataFromString = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let query = [
                    kSecClass as String : kSecClassGenericPassword as String,
                    kSecAttrAccount as String: account,
                    kSecValueData as String : dataFromString] as [String: Any]
            let status = SecItemAdd(query as CFDictionary, nil)
            if (status != errSecSuccess) {    // Always check the status
                if #available(iOS 11.3, *) {
                    if let err = SecCopyErrorMessageString(status, nil) {
                        print("Write failed: \(err)")
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
    
//    @discardableResult
//    func loadKeys(user: String) -> Data? {
//        let query = [
//            kSecClass as String : kSecClassGenericPassword,
//            kSecAttrAccount as String : user,
//            kSecReturnData as String : kCFBooleanTrue,
//            kSecMatchLimit as String : kSecMatchLimitOne
//        ] as [String : Any]
//
//        var dataTypeRef: AnyObject?
//        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
//
//        if status == noErr {
//            print("loaded")
//            return dataTypeRef as! Data?
//        } else {
//            print("nao carregou")
//            return nil
//        }
//    }
    
    func loadPassword(account:String) -> String? {
        // Instantiate a new default keychain query
        // Tell the query to return a result
        // Limit our results to one item
        let query = [
                    kSecClass as String : kSecClassGenericPassword,
                    kSecAttrAccount as String : account,
                    kSecReturnData as String : kCFBooleanTrue,
                    kSecMatchLimit as String : kSecMatchLimitOne] as [String : Any]
        
        var dataTypeRef :AnyObject?
        
        // Search for the keychain items
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        var contentsOfKeychain: String?
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        
        return contentsOfKeychain
    }
}

struct Credentials {
    var username: String
    var password: String
}

enum KeychainError: Error {
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}


