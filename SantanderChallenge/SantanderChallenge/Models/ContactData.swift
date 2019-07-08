//
// ContactData.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import Foundation

class ContactData {
    var name: String
    var phone: String
    var email: String?
    
    init(name: String, phone: String, email: String? = nil) {
        self.name = name
        self.phone = phone
        self.email = email
    }
}
