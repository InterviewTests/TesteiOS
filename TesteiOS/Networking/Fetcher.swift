//
//  Fetcher.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import Alamofire


struct Fetcher {
    
    let networking:Networking
    
    func fetch(request:URLRequest, _ response: @escaping(Any?) -> ()) {
        networking.request(request:request) { data in
            response(data)
        }
    }
    
}
