//
// String+Extension.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

extension String {
    var removingNonDigitCharacters: String {
        return replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    }
    
    var validEmail: Bool {
        return self.range(
            of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
            options: String.CompareOptions.regularExpression,
            range: nil,
            locale: nil) != nil
    }
}
