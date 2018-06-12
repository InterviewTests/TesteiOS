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
import RxSwift

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

    private var formviews = [Int: UIView]()

    init(rootView: UIView, context: IFormContext) {
        self.currentParent = rootView
        self.context = context
    }

    class func changeButtonStyle(_ button: UIButton) {
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.white, for: .highlighted)
        button.setBackgroundImage(UIImage(color: UIColor.appPrimaryColor()), for: .normal)
        button.setBackgroundImage(UIImage(color: UIColor.appPrimaryColor().withAlphaComponent(0.4)), for: .highlighted)
    }

}

private extension FormViewCreator {

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
    
    func createFormTitle(parentView: UIView) -> UILabel {
        let label = UILabel()
        label.text = "Contato"
        label.textAlignment = .center
        label.font = UIFont.fontDIN(ofSize: 20.0)
        parentView.addSubview(label)
        FormConstraintUtils.setCellConstraintsForContentView(label, contentView: parentView, topSibling: nil, topSpacing: 30)
        return label
    }

    func createField(node: FormCell) -> SkyFloatingLabelTextField{
        let textField = SkyFloatingLabelTextField()
        textField.placeholder = node.message
        textField.font = UIFont.fontDIN(ofSize: 15.0)
        textField.titleFont = UIFont.fontDIN(ofSize: 12.0)
        textField.placeholderFont = UIFont.fontDIN(ofSize: 15.0)
        textField.selectedLineColor = UIColor.darkGray
        textField.selectedTitleColor = UIColor.darkGray
        return textField
    }
    
    func createText(node: FormCell) -> UILabel {
        let label = UILabel()
        label.font = UIFont.fontDIN(ofSize: 13.0)
        label.text = node.message
        return label
    }
    
    func createImage(node: FormCell) -> UIImageView {
        return UIImageView()
    }
    
    func createCheckBox(node: FormCell) -> FormUICheckBox {
        let checkBox = FormUICheckBox()
        checkBox.checkBox.boxType = .square
        checkBox.checkBox.onCheckColor = UIColor.white
        checkBox.checkBox.onFillColor = UIColor.appPrimaryColor()
        checkBox.checkBox.onTintColor = checkBox.checkBox.tintColor
        checkBox.titleLabel.font = UIFont.fontDIN(ofSize: 13.0)
        checkBox.titleLabel.text = node.message

        checkBox.checkBox.rx.selectionChanged.asObservable().subscribe(onNext: { (on) in
            if let show = node.show {
                self.focusOn(id: show)
            }
        }).disposed(by: self.context.disposeBag!)

        return checkBox
    }
    
    func creatSend(node: FormCell) -> UIButton {
        let button = self.createButton()
        button.rx.controlEvent(.touchUpInside).subscribe(onNext: {
            self.context.sendNewMessage()
        }).disposed(by: self.context.disposeBag!)
        button.setTitle("Enviar", for: .normal)
        return button
    }

    func createButton() -> UIButton {
        let button = UIButton()
        FormViewCreator.changeButtonStyle(button)
        return button
    }

    func focusOn(id: Int) {
        if let view = self.formviews[id] as? SkyFloatingLabelTextField {
            view.becomeFirstResponder()
        }
    }

    func registerCellView(_ cell: FormCell, view: UIView) {
        if let id = cell.id {
            self.formviews[id] = view
        }
    }

    class func setFormCellProperties(_ cellView: UIView, cell: FormCell) {
        cellView.isHidden = cell.hidden != nil ? cell.hidden! : false
    }
}

extension FormViewCreator: IFormVisitor {

    typealias T = UIView

    func visit(node: FormData) -> UIView {
        var parentheight: CGFloat = 50.0
        self.currentParent = self.layoutScrollView()
        var topSibling: UIView = self.createFormTitle(parentView: self.currentParent)

        if let cells = node.cells {
            for cell in cells {
                let cellView = cell.accept(visitor: self)
                self.currentParent.addSubview(cellView)
                FormConstraintUtils.setCellConstraintsForContentView(cellView, contentView: self.currentParent, topSibling: topSibling, topSpacing: cell.topSpacing != nil ? CGFloat(cell.topSpacing!) : 8.0)
                FormConstraintUtils.setCellDefaultHeightConstraints(cellView, height: 40.0)
                parentheight = parentheight + (cell.topSpacing != nil ? CGFloat(cell.topSpacing!) : CGFloat(8.0))
                parentheight = parentheight + 40.0
                topSibling = cellView
            }
        }

        self.currentParent.heightAnchor.constraint(equalToConstant: parentheight).isActive = true
        return self.currentParent
    }

    func visit(node: FormCell) -> UIView {
        var view = UIView()
        if let typeValue = node.type,
            let type = FormCellType.init(rawValue: typeValue) {
            if type == FormCellType.field {
                view = createField(node:node)
            }else if type == FormCellType.text {
                view = createText(node:node)
            }else if  type == FormCellType.image {
                view = createImage(node: node)
            }else if  type == FormCellType.checkbox {
                view = createCheckBox(node:node)
            }else if type == FormCellType.send {
                view = creatSend(node:node)
            }
            self.registerCellView(node, view: view)
        }

        return view

    }
}


