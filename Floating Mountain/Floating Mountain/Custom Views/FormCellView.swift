//
//  FormCellView.swift
//  Floating Mountain
//
//  Created by Leonardo Oliveira on 9/15/18.
//  Copyright © 2018 Leonardo Oliveira. All rights reserved.
//

import UIKit

class FormCellView: UIView {
    
    var identifier: Int = 0
    
}

extension FormCellView {
    
    convenience init(formCell: Contact.FetchForm.ViewModel.CellViewModel) {
        let innerView: UIView
        switch formCell.type {
        case .textField:
            let textField = UITextField()
            textField.placeholder = formCell.message
            textField.borderStyle = .roundedRect
            textField.sizeToFit()
            innerView = textField
            break
        case .label:
            let label = UILabel()
            label.text = formCell.message
            label.font = UIFont(name: "DINPro-Regular", size: 16)
            label.textColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.sizeToFit()
            innerView = label
            break
        case .image:
            let imageView = UIImageView()
            innerView = imageView
            break
        case .checkbox:
            let button = CheckboxButton()
            button.titleEdgeInsets.left = 8
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.font = UIFont(name: "DINPro-Regular", size: 16)
            button.setTitleColor(#colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1), for: .normal)
            button.setTitle(formCell.message, for: .normal)
            button.contentHorizontalAlignment = .left
            button.sizeToFit()
            innerView = button
            break
        case .send:
            let button = UIButton()
            button.setTitle(formCell.message, for: .normal)
            button.titleLabel?.font = UIFont(name: "DINPro-Medium", size: 16)
            button.setTitleColor(.white, for: .normal)
            button.setBackgroundImage(#imageLiteral(resourceName: "button-background-normal"), for: .normal)
            button.sizeToFit()
            innerView = button
            break
        }
        let topSpacing = CGFloat(formCell.topSpacing)
        let height = innerView.frame.height + topSpacing
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: height))
        self.identifier = formCell.id
        self.isHidden = formCell.hidden
        self.translatesAutoresizingMaskIntoConstraints = false
        innerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(innerView)
        let topConstraint = innerView.topAnchor.constraint(equalTo: topAnchor, constant: topSpacing)
        let leadingConstraint = innerView.leadingAnchor.constraint(equalTo: leadingAnchor)
        let trailingConstraint = innerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        let bottomConstraint = innerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        addConstraints([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
    
}
