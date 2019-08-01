//
//  LoginWorkerSpy.swift
//  TesteMarcioTests
//
//  Created by marcio-mac on 31/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

@testable import TesteMarcio

class LoginWorkerSpy : LoginWorkerProtocol {
    
    var validateLoginCalled = false
    func validateLogin(user: String, password: String, completionBlock: @escaping (UserAccount?) -> Void) {
        validateLoginCalled = true
        let user = UserAccount()
        user.userId = 1
        completionBlock(user)
    }
    
    var loadLoginCallled = false
    func loadLogin(completionBlock: @escaping (String?, String?) -> Void) {
        loadLoginCallled = true
        completionBlock("user","")
    }
    
    var saveLoginCalled = false
    func saveLogin(user: String, password: String) {
        saveLoginCalled = true
    }
    
    
}
