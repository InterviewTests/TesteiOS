//
//  FundsModels.swift
//  TesteIOS
//
//  Created by Sidney Silva on 15/06/2018.
//  Copyright (c) 2018 Sakura Soft. All rights reserved.
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
