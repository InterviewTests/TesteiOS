//
//  FormCellView.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/15/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialTextFields

struct FormCellData {
    let identifier: Int
    let showIdentifier: Int?
    let value: Any?
}

class FormCellView: UIView {
    
    var identifier: Int = 0
    var showIdentifier: Int?
    
    private var topSpacingConstraint: NSLayoutConstraint?
    
    var regularFont: UIFont? {
        return UIFont(name: "DINPro-Regular", size: 16)
    }
    
    var mediumFont: UIFont? {
        return UIFont(name: "DINPro-Medium", size: 16)
    }
    
    func setup(for formCell: Contact.FetchForm.ViewModel.CellViewModel) {
        self.identifier = formCell.id
        self.showIdentifier = formCell.show
        self.isHidden = formCell.hidden
        self.topSpacingConstraint?.constant = CGFloat(formCell.topSpacing)
    }
    
    func setupConstraints(for view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = view.topAnchor.constraint(equalTo: topAnchor)
        let leadingConstraint = view.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingConstraint = view.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottomConstraint = view.bottomAnchor.constraint(equalTo: bottomAnchor)
        addConstraints([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
        self.topSpacingConstraint = topConstraint
    }
    
    func isValid() -> Bool {
        return true
    }
}
