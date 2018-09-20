//
//  JSONHelper.swift
//  TesteiOS
//
//  Created by Nicolau on 14/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import Foundation

func decodeFormJSON(fromFile filename: String) -> [Cell] {
    let path = Bundle.main.path(forResource: filename, ofType: "json")
    
    do {
        let data: NSData = try NSData(contentsOfFile: path!)
        let form = try JSONDecoder().decode(Form.self, from: data as Data)
        
        return form.cells
    } catch let error {
        print("\(error) - \(error.localizedDescription)")
        return []
    }
}

func decodeFundJSON(fromFile filename: String) -> Screen? {
    let path = Bundle.main.path(forResource: filename, ofType: "json")
    
    do {
        let data: NSData = try NSData(contentsOfFile: path!)
        let fundScreen = try JSONDecoder().decode(FundScreen.self, from: data as Data)
        
        return fundScreen.screen
    } catch let error {
        print("\(error) - \(error.localizedDescription)")
        return nil
    }
}
