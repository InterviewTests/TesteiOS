//
//  ConfigurableController.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ConfigurableController: UIViewController {
    var usedView: UIView { get set }
    
    func setupView()
    func addSubView()
    func setupConstraints()
}

extension ConfigurableController {
    func setupView() {
        addSubView()
        setupConstraints()
    }
    func addSubView() {self.view.addSubview(usedView)}
    func setupConstraints() {usedView.fillSuperview()}
}
