//
//  APIService.swift
//  TesteiOS
//
//  Created by Andre Paganin on 04/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
//

import Foundation
import Alamofire

enum APIResult {
    case success
    case apiError
    case dataError
}

class APIService {

    class func fetchJsonData<T: Decodable>(with url: String, completion: @escaping (T?, APIResult) -> Void) {
        Alamofire.request(url).responseJSON { (response) in

            guard response.result.isSuccess,
                let jsonData = response.data else {
                completion(nil, .apiError)
                return
            }
            do {
                let entity: T? = try APIService.parseJsonDataToClass(jsonData)
                completion(entity, .success)
            } catch {
                completion(nil, .dataError)
            }
        }
    }

    class func parseJsonDataToClass<T: Decodable>(_ data: Data) throws -> T? {
        return try JSONDecoder().decode(T.self, from: data)
    }

}


