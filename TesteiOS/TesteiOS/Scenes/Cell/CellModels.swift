//
//  CellModels.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import Foundation

enum Cells {
    enum FetchCells {
        struct Request {
        }
        struct Response {
            var cells: [Cell]
        }
        struct ViewModel {
            struct DisplayedCell {
                var id: Int
                var type: Int
                var message: String
                var typefield: Int?
                var hidden: Bool
                var topSpacing: Double
                var show: Int?
                var required: Bool
                var isSelected: Bool
                var isValidated: Bool
            }
            var displayedCells: [DisplayedCell]
        }
    }
}
