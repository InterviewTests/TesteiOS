//
//  Settings.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

struct Settings {
    static let shared = Settings()
    
    let apiURL: String
    
    private init(){
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")!
        let plist = NSDictionary(contentsOfFile: path) as! [AnyHashable: Any]
        
        let settings = plist["AppSettings"] as! [AnyHashable: Any]
        apiURL = settings["ApiURL"] as! String
    }
}
