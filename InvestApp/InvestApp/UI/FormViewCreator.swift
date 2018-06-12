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

enum FormTextFieldType: String {
    case text = "1"
    case telNumber = "2"
    case email = "3"
}

struct FormViewConstants {
    static let emailRegex = "[A-Z0-9a-z]+([._%+-]{1}[A-Z0-9a-z]+)*@[A-Z0-9a-z]+([.-]{1}[A-Z0-9a-z]+)*(\\.[A-Za-z]{2,4}){0,1}"
    static let foneFormatter = "(##) ####-####"
    static let foneFormatter1 = "(##) #####-####"
}

class FormViewCreator {

    private var context: IFormContext
    
    private var currentParent = UIView()

    private var formviews = [Int: (UIView, FormCell)]()

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
            self.setFormCellProperties(view, cell: node)
            self.registerCellView(view, cell: node)
        }
        
        return view
        
    }
}

private extension FormViewCreator {

    func validateRequired(formField: SkyFloatingLabelTextField, cell: FormCell) -> Bool {
        var isValid = true
        
        if let required = cell.required,
                required && (formField.text == nil || formField.text!.isEmpty) {
                isValid = false
        }
        
        return isValid
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func validateFormFields() -> Bool {
        var isValid = true
        var isHidden = false
        for formCell in self.formviews.values.enumerated() {
            isHidden = formCell.element.1.hidden != nil ? formCell.element.1.hidden! : false
            if let field = formCell.element.0 as? SkyFloatingLabelTextField,
                !isHidden {
                field.errorMessage = nil
                if !validateRequired(formField: field, cell: formCell.element.1) {
                    isValid = false
                    field.errorMessage = "Campo obrigatório"
                } else if let typeField = formCell.element.1.typefield,
                    let typeFieldValue = FormTextFieldType(rawValue: typeField),
                    let fieldText = field.text {
                
                    switch typeFieldValue {
                    case .email:
                        if !validateEmail(fieldText) {
                            isValid = false
                            field.errorMessage = "E-mail inválido"
                        }
                    case .telNumber:
                        break
                    default:
                        break
                    }
                }
            }
        }
        return isValid
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
        
        if let type = node.typefield,
            let textFieldType = FormTextFieldType(rawValue: type) {
            switch textFieldType {
            case .text:
                textField.keyboardType = .default
            case .telNumber:
                textField.keyboardType = .numbersAndPunctuation
            case .email:
                textField.keyboardType = .emailAddress
            }
        }
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
            if let show = node.show,
                on {
                self.focusOn(id: show)
            }
        }).disposed(by: self.context.disposeBag!)

        return checkBox
    }
    
    func creatSend(node: FormCell) -> UIButton {
        let button = self.createButton()
        button.rx.controlEvent(.touchUpInside).subscribe(onNext: {
            if self.validateFormFields() {
                self.context.sendNewMessage()
            }
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
        var hidden = false
        if let formCell = self.formviews[id],
            let view = formCell.0 as? SkyFloatingLabelTextField {
            hidden = formCell.1.hidden != nil ? formCell.1.hidden! : false
            if !hidden {
                view.becomeFirstResponder()
            }
        }
    }

    func registerCellView(_ cellView: UIView, cell: FormCell) {
        if let id = cell.id {
            self.formviews[id] = (cellView, cell)
        }
    }

    func setFormCellProperties(_ cellView: UIView, cell: FormCell) {
        cellView.isHidden = cell.hidden != nil ? cell.hidden! : false
    }
}
