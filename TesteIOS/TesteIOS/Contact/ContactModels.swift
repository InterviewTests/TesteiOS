//
//  ContactModels.swift
//  TesteIOS
//
//  Created by Sidney Silva on 11/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
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
