//
//  ApiManager.swift
//  TesteIOS
//
//  Created by Sidney Silva on 09/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

typealias Response = (Data?, Error?) -> ()

class ApiManager: NSObject {
    
    func fetchCells(stringUrl: String, success: @escaping Response, failure: @escaping Response) {
        guard let url = URL(string: stringUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil && data != nil else {
                failure(data, error)
                return
            }
            
            success(data, error)
        }.resume()
        
    }
}
