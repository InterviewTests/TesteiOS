//
//  AddContactModels.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import UIKit

enum AddContactModels {
    
    enum Cells {
        struct Request {
        }
        struct Response {
            var cells : [Cell]
        }
        struct ViewModel {
            var viewModel : [CellViewModel]
        }
    }
}
