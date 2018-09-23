//
//  FormularioRequest.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class FormularioRequest: NSObject {
    
    class func getFormData(page: Int, completion: @escaping ([String: [FormObjectMapper]]?, Error?) -> Void) {
        
        let urlString:String = String.init(format: "https://floating-mountain-50292.herokuapp.com/cells.json")
        
        Alamofire.request(urlString).responseJSON { response in
         
            if let json = response.result.value {
                let responseObj = Mapper<FormObjectMapper>().mapDictionaryOfArrays(JSON: json as! [String : [[String : Any]]])
                completion(responseObj, nil)
            }
            
        }
    }

}
