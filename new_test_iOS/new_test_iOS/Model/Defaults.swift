//
//  LastLogin.swift
//  new_test_iOS
//
//  Created by gabriel.p.dezena on 26/10/2018.
//  Copyright © 2018 gabriel.dezena. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let (userKey, passKey) = ("user", "pass")
    static let userSession = "gabriel.dezena.new-test-iOS"

    struct Login {
        
        var user: String?
        var pass: String?
        
        init(_ json: [String: String]) {
            self.user = json[userKey]
            self.pass = json[passKey]
        }
    }
    
    static var saveLogin = { (user: String, pass: String) in
        UserDefaults.standard.set([userKey: user, passKey: pass], forKey: userSession)
    }
    
    static var getLogin = { _ -> Login in
        return Login((UserDefaults.standard.value(forKey: userSession) as? [String: String]) ?? [:])
    }(())
    
    static func clearUserData(){
        UserDefaults.standard.removeObject(forKey: userSession)
    }
}

