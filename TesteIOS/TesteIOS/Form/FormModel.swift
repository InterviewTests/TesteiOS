//
//  FormModel.swift
//  TesteIOS
//
//  Created by Sidney Silva on 09/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

struct FormModel {
    
    struct Fetch {
        struct Request {}
        
        struct Response {
            var cells: [Cell]
            var message: String
        }
        
        struct ViewModel: Codable {
            var cells: [Cell]
        }
        
        
    }
}
