//
//  Verificar.swift
//  TesteSantander
//
//  Created by Nayara on 04/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import Foundation
import PhoneNumberKit

class Util: NSObject {
    //Validar email
    let phoneNumberKit = PhoneNumberKit()
    static let shared = Util()
    func isValidEmail(email:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
   
    func formatPhone(phone: String)->String{
        do {
            let phoneNumber = try phoneNumberKit.parse(phone, withRegion: "BR", ignoreType: true)
            return phoneNumberKit.format(phoneNumber, toType: .national)
        }
        catch {
            return phone
            print("Generic parser error")
        }
    }

    
    
}
