//
//  User.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 06/09/18.
//  Copyright © 2018 Erika de Almeida Segatto. All rights reserved.
//

import Foundation


public struct User {
    public let id: String
    public var name: String
    public var dateOfBirth: Date?
    public var gender: String?
    
    
    public init(id: String, name: String, dateOfBirth: Date?, gender: String?) {
        self.id = id
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.gender = gender
    }
}
