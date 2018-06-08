//
//  FormUICheckBox.swift
//  InvestApp
//
//  Created by Victor tavares on 08/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import UIKit
import BEMCheckBox

public class FormUICheckBox: UIView {

    public var title: String? {
        didSet {
            setupTitle()
        }
    }

    public var titleColor: UIColor = .black {
        didSet {
            self.titleLabel.textColor = titleColor
        }
    }

    public var titleLabel = UILabel()

    public let checkBox = BEMCheckBox()

    public init() {
        super.init(frame: .zero)
        setupCheckBoxConstraints()
        setupTitleConstraints()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTitle() {
        self.titleLabel.text = title
    }

    private func setupCheckBoxConstraints() {
        let parentMarginsGuide = self.layoutMarginsGuide

        self.addSubview(checkBox)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkBox.leadingAnchor.constraint(equalTo: parentMarginsGuide.leadingAnchor).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        checkBox.widthAnchor.constraint(equalTo: checkBox.heightAnchor, multiplier: 1.0).isActive = true
    }

    private func setupTitleConstraints() {
        self.addSubview(titleLabel)
        let parentMarginsGuide = self.layoutMarginsGuide
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: parentMarginsGuide.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: parentMarginsGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 8.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0).isActive = true
    }
}

