//
//  LoginWorker.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import Foundation

protocol LoginWorkerProtocol {
    func validateLogin(user: String, password: String, completionBlock: @escaping (_ userAccount: UserAccount?) -> Void)
    func loadLogin(completionBlock: @escaping (_ user: String?, _ password: String?) -> Void)
    func saveLogin(user: String, password: String)
}

class LoginWorker : LoginWorkerProtocol {
    
    func validateLogin(user: String, password: String, completionBlock: @escaping (_ userAccount: UserAccount?) -> Void) {
        
        LoginAPI.login(user: user, passowrd: password) { response in
            if let retorno = response {
                if let _ = retorno.error.code {
                    completionBlock(nil)
                } else {
                    completionBlock(retorno.userAccount)
                }
            }
        }
    }
    
    func loadLogin(completionBlock: @escaping (String?, String?) -> Void) {
        let defaults = UserDefaults.standard
        if let user = defaults.string(forKey: "user") {
            completionBlock(user, "")
            return
        }
        completionBlock(nil, nil)
    }
    
    func saveLogin(user: String, password: String) {
        let defaults = UserDefaults.standard
        defaults.set(user, forKey: "user")
    }
    
}
