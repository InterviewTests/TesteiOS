//
// NetworkProviderProtocol.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 05/07/19.
//

import Foundation

typealias NetworkResponse = Result<Data, NetworkError>

protocol NetworkProviderProtocol {
    func fetchFormData(_ completion: @escaping (NetworkResponse) -> Void)
    func fetchFundsFields(_ completion: @escaping (NetworkResponse) -> Void)
}
