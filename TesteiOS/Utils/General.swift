//
//  General.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation

class General {
    
    // Método para obter a URL da API salva em arquivo tipo .plist
    class func getApiURL() -> String {
        var apiUrl : String = ""
        
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            let dictRoot = NSDictionary(contentsOfFile: path)
            if let dict = dictRoot {
                apiUrl = dict["API_URL"] as! String
            }
        }
        
        return apiUrl
    }
}
