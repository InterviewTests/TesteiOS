//
//  InvestDecoder.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class InvestDecoder {
    var data:Data
    
    init(data:Data) {
        self.data = data
    }
    
    func decode() -> Screen? {
        
        let decoder = JSONDecoder()
        do {
            let investScreen = try decoder.decode(InvestScreen.self, from: self.data)
            
            return investScreen.screen
            
        } catch {
            print(error)
            debugPrint("Error occurred")
        }
        
        return nil
    }
    
}
