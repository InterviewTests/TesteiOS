//
//  SantanderService.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 24/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

import UIKit

struct KeyDict {
    let cells: String
    let fund: String
}

protocol SantanderServiceInterface : class{
    func getKeys() -> KeyDict;
}

class SantanderService: SantanderServiceInterface {
    
    func getKeys()-> KeyDict{
        var keys : NSDictionary?
        
        if let path = Bundle.main.path(forResource: "stkeys", ofType: "plist"){
            keys = NSDictionary(contentsOfFile: path)!
        }
        if let data = keys{
            return KeyDict(cells: data["cells"] as! String, fund: data["fund"] as! String)
        }else{
            return KeyDict(cells: "", fund: "")
        }
    }
    
}
