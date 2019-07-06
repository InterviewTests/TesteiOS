//
// Bundle+Extension.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

extension Bundle {
    static func loadJSONFromBundle(resourceName: String) -> Data? {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "json") else {
            fatalError("⚠️ Invalid URL")
        }
        do {
            return try Data(contentsOf: url)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
