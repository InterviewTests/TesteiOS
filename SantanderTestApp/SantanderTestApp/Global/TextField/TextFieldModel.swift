//
//  TextFieldModel.swift
//  SantanderTestApp
//
//  Created by Frederico Franco on 23/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import Foundation


// MARK: - Input

struct TextFieldModel {
    
    // MARK: Properties
    
    let title: String
    private(set) var typedText: String
    
    enum Validation {
        case noValidationSpecified
        case with(validator: TextFieldValidator, result: Bool?)
        
        public func isValid() -> Bool? {
            if case let .with(_, result: isValid) = self {
                return isValid
            } else {
                return nil
            }
        }
        
        fileprivate func getValidator() -> TextFieldValidator? {
            if case let .with(validator: validator, _) = self {
                return validator
            } else {
                return nil
            }
        }
    }
    private(set) var validation: Validation
    
    var isTextFieldActive: Bool
    
    // MARK: Init
    
    init(title: String, typedText: String, validator: TextFieldValidator? = nil, isTextFieldActive: Bool = false) {
        self.title = title
        self.typedText = typedText
        self.isTextFieldActive = isTextFieldActive
        
        if let validator = validator {
            validation = .with(validator: validator, result: nil)
            let _ = try? validateTypedText()
        } else {
            validation = .noValidationSpecified
        }
    }
    
    // MARK: Methods
    
    mutating func clearTypedText() {
        typedText = ""
    }
    
    
    struct TextWithInvalidLengthError: Error { }
    
    mutating func changeTypedText(with text: String) throws {
        let hasValidLength = validation.getValidator()?.hasValidLength(text) ?? true
        if hasValidLength {
            typedText = text
        } else {
            throw TextWithInvalidLengthError()
        }
    }
    
    struct TryingToValidateTextFieldWithoutValidatorError: Error { }
    
    @discardableResult
    mutating func validateTypedText() throws -> Bool {
        guard let validator = validation.getValidator() else {
            throw TryingToValidateTextFieldWithoutValidatorError()
        }
        
        let isValid = validator.isValidText(typedText) && validator.hasValidLength(typedText)
        validation = .with(validator: validator, result: isValid)
        
        return isValid
    }
}

// MARK: - Validator

protocol TextFieldValidator {
    
    var maxTextLength: Int? { get }
    func isValidText(_ text: String) -> Bool
}

extension TextFieldValidator {
    
    func hasValidLength(_ text: String) -> Bool {
        if let max = maxTextLength {
            return text.count <= max
        } else {
            return true
        }
    }
}
