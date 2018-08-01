//
//  FundsModels.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//


import UIKit

enum FundsModel {
  
    enum Fetch {
        struct Request {
            var url: String?
        }
        struct Response {
            var screen: Funds?
            var error: Error?
            var message: String
        }
        struct ViewModel {
            var screen: Funds?
            var error: Error?
        }
    }
}
