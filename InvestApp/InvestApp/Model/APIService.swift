//
//  APIService.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import Alamofire

class APIService {

    class func fetchJsonData<T: Decodable>(with url: String, completion: @escaping (T?) -> Void) {
        Alamofire.request(url).responseJSON { (response) in

            guard let jsonData = response.data else { return }
            var json: T? = nil

            do {
                json = try JSONDecoder().decode(T.self, from: jsonData)
            } catch {
                print("overview decoder error")
            }
            completion(json)
        }
    }

}
