//
//  BasePresenter.swift
//  ShareKNX
//
//  Created by Daniel Reis on 04/09/17.
//  Copyright © 2017 MadeinWeb. All rights reserved.
//

import Foundation

protocol BasePresenterDelegate: class {
    func loading(_ loading: Bool)
    func error(_ title: String?, _ error: String)
}

class BasePresenter {
}
