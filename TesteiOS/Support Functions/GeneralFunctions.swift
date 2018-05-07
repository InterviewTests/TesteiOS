//
//  GeneralFunctions.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class GeneralFunctions: NSObject {
    
    // função para validação de campo de endereço de email durante o data entry (keystroke)
    // a função é acionada a cada caracter digitado e retorna TRUE quando é um caracter válido e FALSE quanddo é um caracter inválido
    // a função também retorna FALSE quando o primeiro caracter é um @ e também limita o tamanho máximo de endereço de emai a 40 caracteres
    func handleEmailField(text: String, withRange range: NSRange, withReplacementString replacementString: String) -> Bool {
        var illegalCharactersSet = CharacterSet.init(charactersIn: "!?><,\\/|`~\'\"[]{}±#$%^&*()=+")
        
        let currentString = text as NSString
        
        let newString = currentString.replacingCharacters(in: range, with: replacementString)
        
        if currentString.length == 0 && replacementString == "@" {
            return false
        }
        
        if currentString.contains("@") {
            illegalCharactersSet = CharacterSet.init(charactersIn: "!?><,\\/|`~\'\"[]{}±#$%^&*()=+@")
        }
        
        let components = replacementString.components(separatedBy: illegalCharactersSet)
        if components.count > 1 {
            return false
        }
        
        return newString.characters.count <= 40
    }
    
    // função para validação de campo de endereço de email após o data entry
    func isValidEmail(emailAddress: String) -> Bool {
        //print("validate emailId: \(testStr)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: emailAddress)
        return result
    }
    
}
