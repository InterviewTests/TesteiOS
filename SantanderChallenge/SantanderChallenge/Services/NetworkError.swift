//
// NetworkError.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

enum NetworkError: Error {
    case invalidPath
    case invalidStatusCode
    case missingResponseData
    case responseError(String)
}
