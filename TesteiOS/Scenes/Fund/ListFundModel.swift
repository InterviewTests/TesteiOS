//
//  ListFundModel.swift
//  TesteiOS
//
//  Created by Macbook on 10/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import Foundation

enum ListFund : Decodable {
    init(from decoder: Decoder) throws {
        try self.init(from: decoder)
    }
    
    
    enum Fetch :Decodable {
        init(from decoder: Decoder) throws {
            try self.init(from: decoder)
        }
        
        struct Request {}
        
        struct Response : Decodable {
            var screen : Screen
        }
    }
}
