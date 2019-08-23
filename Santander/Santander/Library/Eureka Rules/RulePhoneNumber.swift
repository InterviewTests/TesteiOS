//
//  RulePhoneNumber.swift
//  Santander
//
//  Created by Orlando Amorim on 13/08/19.
//

import Eureka

public class RulePhoneNumber: RuleType {
    
    public var regExpr: String
    public var id: String?
    public var validationError: ValidationError
    public var allowsEmpty = true
    
    public init(regExpr: String = "^(\\([0-9]{2}\\))\\s([9]{1})?([0-9]{4})-([0-9]{4})$",
                allowsEmpty: Bool = true,
                msg: String = "Field value should be a valid phone number!",
                id: String? = nil) {
        self.validationError = ValidationError(msg: msg)
        self.regExpr = regExpr
        self.allowsEmpty = allowsEmpty
        self.id = id
    }
    
    public func isValid(value: String?) -> ValidationError? {
        if let value = value, !value.isEmpty {
            let predicate = NSPredicate(format: "SELF MATCHES %@", regExpr)
            guard predicate.evaluate(with: value) else {
                return validationError
            }
            return nil
        } else if !allowsEmpty {
            return validationError
        }
        return nil
    }
}
