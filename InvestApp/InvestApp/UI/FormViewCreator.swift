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

extension FormViewCreator {
    
    class func createButton() {
        let button = UIButton()
        FormViewCreator.changeButtonStyle(button)
    }
    
    class func changeButtonStyle(_ button: UIButton) {
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        let color = UIColor.init(red: 204/255, green: 40/255, blue: 15/255, alpha: 1.0)
        button.setBackgroundImage(UIImage(color: color), for: .normal)
        let highlightedColor = UIColor(red: 204/255, green: 40/255, blue: 15/255, alpha: 0.4)
        button.setBackgroundImage(UIImage(color: highlightedColor), for: .highlighted)
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

public extension UIImage {
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

