//
//  RequestAPI.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class RequestAPI {
    class func sendGETRequest(urlMethod: String, completion: @escaping (Data?) -> (), errorHandled: @escaping (String) -> ()) {
        // Formar a URL da requisição
        let urlString = General.getApiURL() + urlMethod
        let requestUrl = URL(string: urlString)!
        
        // Verificar se há conexão com internet
        if NetworkReachability.isConnectedToNetwork() {
            DispatchQueue.main.async {
                Alamofire.request(requestUrl, method:.get).responseJSON {
                    response in
                    
                    if  response.result.isSuccess{
                        completion(response.data)
                    } else {
                        errorHandled((response.result.error?.localizedDescription)!)
                    }
                }
            }
        } else {
            errorHandled("Network OFF")
        }
    }
}
