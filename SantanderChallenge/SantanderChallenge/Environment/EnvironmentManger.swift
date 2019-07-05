//
// EnvironmentManger.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 04/07/19.
//

import Foundation

enum EnvironmentIdentifier: String {
    case production = "Production"
    case development = "Development"
}

enum EnvironmentKey: String {
    case environmentName = "ENVIRONMENT_NAME"
    case apiURL = "api_url"
}

class EnvironmentManager {
    
    static let shared: EnvironmentManager = EnvironmentManager()
    
    private init() {}
    
    lazy var environmentId: EnvironmentIdentifier? = {
        guard let name = environmentName else { return nil }
        return EnvironmentIdentifier(rawValue: name)
    }()
    
    fileprivate var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Info.plist file not found")
        }
    }
    
    private lazy var environmentName: String? = {
        guard let name = infoDict[EnvironmentKey.environmentName.rawValue] as? String else {
            fatalError("No environment defined at Info.plist file")
        }
        return name
    }()
    
    private var environmentDict: [String: Any] {
        if let url = Bundle.main.url(forResource: environmentName, withExtension: "plist"),
            let dict = NSDictionary(contentsOf: url) as? [String: Any] {
            return dict
        } else {
            fatalError("Environment plist file not found")
        }
    }
    
    func value<T>(forKey key: EnvironmentKey) -> T? {
        return environmentDict[key.rawValue] as? T
    }
}
