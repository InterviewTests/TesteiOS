//
//  ConfigurableTableViewCell.swift
//  TesteiOS
//
//  Created by Felipe Borges on 10/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

@objc protocol FormTableViewCell where Self: UITableViewCell {
    var topConstraint: NSLayoutConstraint? { get }
    func configure(with model: FormItem, controller: FormController?)
}

extension FormTableViewCell {
    func configure(with model: FormItem) {
        self.configure(with: model, controller: nil)
    }
}
