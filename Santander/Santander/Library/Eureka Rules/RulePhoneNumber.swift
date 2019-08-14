//
//  RulePhoneNumber.swift
//  Santander
//
//  Created by Orlando Amorim on 13/08/19.
//

import Eureka

public class RulePhoneNumber: RuleRegExp {
    
    static let phoneNumberRegExpr = "(?:\\+\\d{2}\\s*(?:\\(\\d{2}\\))|(?:\\(\\d{2}\\)))?\\s*(\\d{4,5}\\-?\\d{4})"
    
    public init(msg: String = "Field value should be a valid phone number!", id: String? = nil) {
        super.init(regExpr: RulePhoneNumber.phoneNumberRegExpr, allowsEmpty: true, msg: msg, id: id)
    }
}
