//
//  FormConstraintUtils.swift
//  InvestApp
//
//  Created by Victor tavares on 07/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import UIKit

class FormConstraintUtils {

    static func setConstraintsForScrollView(_ scrollView: UIScrollView, parent: UIView) {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
    }

    static func setConstraintsForContentView(_ contentView: UIView, scrollView: UIScrollView, mainView parent: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: parent.widthAnchor).isActive = true
    }
    
    static func setCellConstraintsForContentView(_ cell: UIView, contentView: UIView, topSibling: UIView?, topSpacing: CGFloat?) {
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
        cell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8.0).isActive = true
        if let unwrappedTopSibling = topSibling { //Row has a top sibling and has no title
            cell.topAnchor.constraint(equalTo: unwrappedTopSibling.bottomAnchor, constant: topSpacing != nil ? topSpacing! : 8.0).isActive = true
        } else {
            cell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSpacing != nil ? topSpacing! : 8.0).isActive = true
        }
    }

}
