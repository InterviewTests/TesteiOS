//
//  BankAPI.swift
//  new_test_iOS
//
//  Created by gabriel.p.dezena on 27/10/2018.
//  Copyright © 2018 gabriel.dezena. All rights reserved.
//

import Foundation
import Alamofire

enum Error : String {

   case erroData = "Erro ao receber dados do servidor."
   case erroDecoder = "Erro para decodificar os dados do servidor."
   case erroId = "O Id do usuário veio vazio."

}


class BankAPI {
    
    class func getLoginData (user: String, pass: String, onComplete: @escaping (UserAccount) -> Void ,onError: @escaping (Error?) -> Void){
        
        let parameters = [
            "user": user,
            "password": pass
        ]

        Alamofire.request(Api.login, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            
            guard let data = response.data else  {
                onError(.erroData)
                return
            }
            if let userAccountData = try? JSONDecoder().decode(UserAccount.self, from: data) {
                onComplete(userAccountData)
            }else{
                onError(.erroDecoder)
            }
        }
    }
    
    class func loadUserData (session: Int?, onComplete: @escaping (UserData) -> Void ,onError: @escaping (Error?) -> Void){
        
        if let id = session {
            
            let url = Api.statements+"\(id)"
            Alamofire.request(url).responseJSON { (response) in
                
                guard let data = response.data else  {
                    onError(.erroData)
                    return
                }
                if let userData = try? JSONDecoder().decode(UserData.self, from: data) {
                    onComplete(userData)
                }else{
                    onError(.erroDecoder)
                }
            }

        }else{
            onError(.erroId)
        }
        
       
    }
}

