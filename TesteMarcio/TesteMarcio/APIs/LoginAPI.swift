//
//  LoginAPI.swift
//  teste-ios
//
//  Created by marcio-mac on 25/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import Alamofire
import UIKit

class LoginAPI {
    static func login(user:String, passowrd:String, completionBlock: @escaping ((_ returnValue: Retorno?) -> Void)) {
        
        let parameters: [String:String] = [
            "user":user,
            "password":passowrd
        ]
        
        Alamofire.request("https://bank-app-test.herokuapp.com/api/login",method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON  {
                response in switch response.result {
                case .success:
                    
                    if let data = response.data {
                        let userAccount = try? JSONDecoder().decode(Retorno.self, from: data)
                        completionBlock(userAccount)
                    }

                case .failure(let error):
                    print("Request failed with error: \(error)")
                    completionBlock(nil)
                }
            }
    }
}

struct Retorno: Codable {
    let error : Error
    let userAccount: UserAccount
}

struct Error: Codable {
    let code: Int?
    let message: String?
}

