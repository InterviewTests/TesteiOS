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
import RxCocoa
import SkyFloatingLabelTextField

enum FormCellType: Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum FormTextFieldType: Int {
    case text = 1
    case telNumber = 2
    case email = 3
}

class FormViewCreator {

    private var context: IFormContext
    
    private var currentParent = UIView()
    
    private var currentToAnchor: NSLayoutYAxisAnchor?

    init(rootView: UIView, context: IFormContext) {
        self.currentParent = rootView
        self.context = context
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
    
    func createField(node: FormCell) -> SkyFloatingLabelTextField{
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = node.message
        return textField
    }
    
    func createText(node: FormCell) -> UILabel {
        let label = UILabel()
        label.text = node.message
        return label
    }
    
    func createImage(node: FormCell) -> UIImageView {
        return UIImageView()
    }
    
    func createCheckbox(node: FormCell) -> UISwitch {
        return UISwitch()
    }
    
    func creatSend(node: FormCell) -> UIButton {
        let button = FormViewCreator.createButton()
        button.rx.controlEvent(.touchUpInside).subscribe(onNext: {
            self.context.sendNewMessage()
        }).disposed(by: self.context.disposeBag!)
        button.titleLabel?.text = "Enviar"
        return button
    }
    
    class func createButton() -> UIButton {
        let button = UIButton()
        FormViewCreator.changeButtonStyle(button)
        return button
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
        var topSibling: UIView?
        self.currentParent = self.layoutScrollView()
        self.currentToAnchor = self.currentParent.topAnchor
        if let cells = node.cells {
            for cell in cells {
                let cellView = cell.accept(visitor: self)
                self.currentParent.addSubview(cellView)
                FormConstraintUtils.setCellConstraintsForContentView(cellView, contentView: self.currentParent, topSibling: topSibling, topSpacing: cell.topSpacing != nil ? CGFloat(cell.topSpacing!) : nil)
                self.currentToAnchor = cellView.bottomAnchor
                topSibling = cellView
            }
        }

        return self.currentParent
    }

    func visit(node: FormCell) -> UIView {
        if let typeValue = node.type,
            let type = FormCellType.init(rawValue: typeValue) {
            if type == FormCellType.field {
                return createField(node:node)
            }else if type == FormCellType.text {
                return createText(node:node)
            }else if  type == FormCellType.image {
                return createImage(node: node)
            }else if  type == FormCellType.checkbox {
                return createCheckbox(node:node)
            }else if type == FormCellType.send {
                return createCheckbox(node:node)
            }
        }
        return UIView()
    }
}


