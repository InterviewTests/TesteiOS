//
//  FormService.swift
//  santander
//
//  Created by Jonatha Lima on 20/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

import Alamofire

protocol FormServiceProtocol: AnyObject {
    func get(completion: @escaping (FormResponse?) -> Void)
}

public class FormService: FormServiceProtocol {
    
    func get(completion: @escaping (FormResponse?) -> Void) {
        
        var components = BaseURL.shared.url
        components.path = Route.form.rawValue
        
        guard let url = components.url else {
            completion(nil)
            return
        }
        
        Alamofire.request(url).validate().responseJSON { result in
            let decoder = JSONDecoder()
            
            guard let data = result.data else {
                completion(nil)
                return
            }
            
            do {
                
                let response = try decoder
                    .decode(FormResponse.self,
                            from: data)
                
                completion(response)
                
            } catch let err {
                print(err.localizedDescription)
                completion(nil)
            }
            
        }
        
    }
    
}
