//
//  ListCellModel.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation

enum ListCell : Decodable {
    init(from decoder: Decoder) throws {
        try self.init(from: decoder)
    }
    

    enum Fetch :Decodable {
        init(from decoder: Decoder) throws {
            try self.init(from: decoder)
        }
        
        struct Request {}
        
        struct Response : Decodable {
            var cells : [Cell]
        }
    }
}
