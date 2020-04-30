//
//  ContactFormWorker.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import Foundation
import Alamofire

class ContactFormWorker {
    /// Request the contact form
    /// - Parameters:
    ///   - completion: completion block
    ///   - error: failure block
    /// - Returns: Contact Form Data
    static func fetchContactForm(completion: @escaping(_ responseData: Data?) -> (), error: @escaping(_ error: Error?) -> ()) {
        let url = APIConstants.baseUrl + APIConstants.contactEndpoint
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                completion(response.data)
                
                return
            }
            
            error(response.error)
        }
    }
}
