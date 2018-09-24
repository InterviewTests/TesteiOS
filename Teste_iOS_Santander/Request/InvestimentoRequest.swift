//
//  InvestimentoRequest.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class InvestimentoRequest: NSObject {
    
    var formData: [InvestimentoModel] = []
    
    class func getInvestimentData(page: Int, completion: @escaping ([String: InvestimentoObjectMapper]?, Error?) -> Void) {
        
        let urlString:String = String.init(format: "https://floating-mountain-50292.herokuapp.com/fund.json")
                
        Alamofire.request(urlString).responseJSON { response in
            if let json = response.result.value {
                let responseObj = Mapper<InvestimentoObjectMapper>().mapDictionary(JSONObject: json)
                completion(responseObj, nil)
            }
            
        }
        
    }
}
