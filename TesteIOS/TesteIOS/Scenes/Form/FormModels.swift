//
//  FormModels.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

enum Form {
    enum FetchCells {
        struct Request{
            
        }
        
        struct Response {
            var cells: [CellModel]
            var error: CellsStoreError?
        }
        
        struct ViewModel {
            struct DisplayedCell {
                var id: Int!
                var type: CellType!
                var message: String!
                var typeField: CellTypeField?
                var hidden: Bool!
                var topSpacing: Double!
                var show: Int?
                var isRequired: Bool!
            }
            
            var displayedCells: [DisplayedCell]
            var error: CellsStoreError?
        }
    }
}
