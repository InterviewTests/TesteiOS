//
//  ViewConfigurationProtocol.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
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
