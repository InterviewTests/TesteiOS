//
//  LoginModels.swift
//  TesteMarcio
//
//  Created by marcio-mac Rabelo on 28/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import Foundation

enum LoginModel {
    enum ValidateLogin {
        struct Request { }
        struct Response {
            let valid: Bool
        }
        struct ViewObject {
            let errorMessage: String
        }
    }
    
    enum Login {
        struct Request {
            let user: String
            let password: String
        }
        struct Response {
            let errorMessage: String
        }
        struct ViewObject {
            let errorMessage: String
        }
    }
    
    enum LoadLogin {
        struct Request { }
        struct Response {
            let user: String
            let password: String
        }
        struct ViewObject {
            let user: String
            let password: String
        }
    }
    
    enum StatementListScreen {
        struct Request { }
        struct Response {
            let user: UserAccount
        }
        struct ViewObject {
            let user: UserAccount
        }
    }
    
    enum ActivityIndicator {
        struct Request { }
        struct Response { }
        struct ViewObject { }
    }
}
