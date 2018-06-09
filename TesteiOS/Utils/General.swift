//
//  General.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation

class General {
    
    // Método para obter a URL da API salva em arquivo tipo .plist
    class func getApiURL() -> String {
        var apiUrl : String = ""
        
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            let dictRoot = NSDictionary(contentsOfFile: path)
            if let dict = dictRoot {
                apiUrl = dict["API_URL"] as! String
            }
        }
        
        return apiUrl
    }

    // Validar email
    class func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // Limpar caracteres speciais do telefone
    class func removeSpecialCharsFromString(_ str: String) -> String {
        struct Constants {
            static let validChars = Set("1234567890")
        }
        return String(str.filter { Constants.validChars.contains($0) })
    }
}
