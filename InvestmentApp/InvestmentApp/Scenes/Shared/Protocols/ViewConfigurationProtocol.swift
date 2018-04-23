//
//  ViewConfigurationProtocol.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

protocol ViewConfigurationProtocol {
    func setupItems()
    func setupLayout()
}

extension ViewConfigurationProtocol {
    func setupView() {
        setupItems()
        setupLayout()
    }
}
