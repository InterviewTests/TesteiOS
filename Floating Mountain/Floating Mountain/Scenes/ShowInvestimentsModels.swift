//
//  ShowInvestimentsModels.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 14/09/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

enum ShowInvestimentsModels {
    
    enum FetchForm {
        
        struct Request {
            
        }
        
        struct Response: Codable {
            let cells: [Cell]
        }
        
        struct ViewModel {
            
        }
        
    }
    
}
