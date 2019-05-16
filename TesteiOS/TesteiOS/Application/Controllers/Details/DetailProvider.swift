//
//  DetailProvider.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class DetailProvider: NSObject {
    
    func getDetails(completion:@escaping(_ detailBase:BaseClass?, _ error:Error?) -> Void) -> Void {
        
        request(RouterAPI.detail)
            .validate(statusCode: 200..<300)
            .responseObject { (response:DataResponse<BaseClass>) in
                switch response.result {
                    case .success(let base): completion(base, nil); break;
                    case .failure(let error): completion(nil, error); break;
                }
        }
        
    }
    
}
