//
//  FormProvider.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class FormProvider: NSObject {
    
    func getCellForm(completion:@escaping(_ cellBase:Cells?, _ error:Error?) -> Void) -> Void {
        
        request(RouterAPI.cellForm)
            .validate(statusCode: 200..<300)
            .responseObject { (response:DataResponse<Cells>) in
                switch response.result {
                    case .success(let cell): completion(cell, nil); break;
                    case .failure(let error): completion(nil, error); break;
                }
        }
        
    }
    
}
