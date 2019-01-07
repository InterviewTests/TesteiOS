//
//  RequestService.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import Foundation
import Alamofire

class RequestService: RequestBase {
    
    /// Requests a list of items for the contact form
    func formList() -> DataRequest{
        return get(endpoint: .form)
    }
    
    /// Requests the details of the product
    func productDetail() -> DataRequest{
        return get(endpoint: .product)
    }
}
