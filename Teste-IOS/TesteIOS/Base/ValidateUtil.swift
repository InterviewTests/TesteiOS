//
//  ValidateUtil.swift
//  TesteIOS
//
//  Created by Sidney Silva on 14/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit
import AnyFormatKit

class ValidateUtil: NSObject {
    static func validate(string: String, pattern: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.firstMatch(in: string, options: [], range: NSRange(location: 0, length: string.count)) != nil
    }
    
    static func phoneFormat(stringPhone: String)-> String?{
        let pattern = stringPhone.count < 11 ?  "(##) ####-####" : "(##) #####-####"
        let phoneFormatter = TextFormatter(textPattern: pattern)
        return phoneFormatter.formattedText(from: stringPhone)
    }
}
