//
//  FormViewCreator.swift
//  InvestApp
//
//  Created by Victor tavares on 07/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import UIKit
import TPKeyboardAvoiding

class FormViewCreator {

    private var currentParent = UIView()

    init(rootView: UIView) {
        self.currentParent = rootView
    }

    func createScrollView() -> TPKeyboardAvoidingScrollView {
        let scrollView = TPKeyboardAvoidingScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }

    func createContentView() -> UIView {
        let contentView = UIView()
        return contentView
    }

    func layoutScrollView() -> UIView {
        let scrollView = createScrollView()
        self.currentParent.addSubview(scrollView)
        FormConstraintUtils.setConstraintsForScrollView(scrollView, parent: self.currentParent)

        let contentView = createContentView()
        scrollView.addSubview(contentView)
        FormConstraintUtils.setConstraintsForContentView(contentView, scrollView: scrollView, mainView: self.currentParent)

        return contentView
    }


}

extension FormViewCreator: IFormVisitor {

    typealias T = UIView

    func visit(node: FormData) -> UIView {
        self.currentParent = self.layoutScrollView()

        if let cells = node.cells {
            for cell in cells {
                let cellView = cell.accept(visitor: self)
                self.currentParent.addSubview(cellView)
            }
        }

        return self.currentParent
    }

    func visit(node: FormCell) -> UIView {
        let labelTest = UILabel()
        labelTest.text = "Test"

        return labelTest
    }

}
