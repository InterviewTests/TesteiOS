//
//  Status.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

typealias ButtonAction = () -> ()

enum ViewStatus<ButtonAction> {
    case internetError(ButtonAction)
    case success
    case requestError(ButtonAction)
    case loading
    case ready
}
