//
//  UserData.swift
//  new_test_iOS
//
//  Created by gabriel.p.dezena on 27/10/2018.
//  Copyright © 2018 gabriel.dezena. All rights reserved.
//

import Foundation

struct UserAccount : Codable {
    
    let userAccount: UserAccountData
    let error: ApiError
    
}
struct UserAccountData : Codable {
    
    let userId: Int?
    let name: String?
    let bankAccount: String?
    let agency: String?
    let balance: Float?
    
}

struct ApiError : Codable {
    let error: String?

}

struct UserData : Codable {
    let statementList : [Statement]
}

struct Statement : Codable {
    
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
    
}
