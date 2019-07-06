//
// NetworkProviderProtocol.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

protocol NetworkProviderProtocol {
    func fetchFormData(_ completion: @escaping (Bool) -> Void)
    func fetchFundsFields(_ completion: @escaping (Bool) -> Void)
}
