//
//  ContactModels.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


import UIKit

enum Contact {
  // MARK: Use cases
  
    enum Fetch {
        struct Request {
            var url: String?
        }
        struct Response {
            var cells: [Cell]?
            var error: Error?
            var message: String
        }
        struct ViewModel {
            var cells: [Cell]?
            var error: Error?
        }
    }
}
