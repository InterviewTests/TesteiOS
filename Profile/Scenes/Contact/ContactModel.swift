//
//  ContactModel.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation

enum ShowContact {
    
    enum GetCell {
        
        struct ViewModel {
            struct Cell {
                var id: Int
                var type: Int
                var message: String
                var typefield: Int
                var hidden: Bool
                var topSpacing: Double
                var show: Int
                var isRequired: Bool
            }
            var cell: Cell
        }
    }
}
