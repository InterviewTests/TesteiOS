//
//  StatusProtocol.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

typealias ButtonAction = () -> ()

enum ViewStatus<ButtonAction> {
    case internetError(ButtonAction)
    case success
    case requestError(ButtonAction)
    case loading
}
