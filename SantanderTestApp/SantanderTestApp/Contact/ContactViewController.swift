//
//  File.swift
//  SantanderTestApp
//
//  Created by Frederico Franco on 24/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ContactViewController: UIViewController {

    // MARK: Model
    
    var model: ContactViewControllerModel
    
    // MARK: Init
    
    init(model: ContactViewControllerModel) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View
    
    var scrollView: UIScrollView!
    var scrollContentGuide: UILayoutGuide!
    
    var fieldsStack: UIStackView!
    
    var nameField: TextField!
    var emailField: TextField!
    var phoneField: TextField!
    
    var checkBox: CheckBox!
    
    var button: Button!
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.white
        
        makeScrollViewAndContentGuide()
        
        makeTextFields()
        
        makeCheckBox()
        
        makeButton()
    }
    
    private func makeScrollViewAndContentGuide() {
        let scroll = UIScrollView()
        
        self.view.addSubview(scroll)
        scroll.snp.makeConstraints {
            $0.top.equalTo(self.topLayoutGuide.snp.bottom)
            $0.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        scrollView = scroll
        
        let guide = UILayoutGuide()
        scroll.addLayoutGuide(guide)
        guide.snp.makeConstraints {
            $0.topMargin.greaterThanOrEqualTo(scroll)
            $0.bottomMargin.lessThanOrEqualTo(scroll)
            $0.centerY.equalTo(scroll).offset(-50).priority(999)
            $0.left.equalTo(scroll).offset(20)
            $0.right.equalTo(scroll).inset(20)
            $0.width.lessThanOrEqualTo(scroll)
        }
        
        scrollContentGuide = guide
    }
    
    private func makeTextFields() {
        nameField = TextField(model: model.nameField)
        emailField = TextField(model: model.emailField)
        phoneField = TextField(model: model.phoneField)
        
        fieldsStack = UIStackView(arrangedSubviews: [nameField, emailField, phoneField])
        fieldsStack.axis = .vertical
        fieldsStack.alignment = .fill
        fieldsStack.distribution = .equalSpacing
        fieldsStack.spacing = 20
        
        scrollView.addSubview(fieldsStack)
        fieldsStack.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(scrollContentGuide)
            $0.bottom.lessThanOrEqualTo(scrollContentGuide)
        }
    }
    
    private func makeCheckBox() {
        checkBox = CheckBox(frame: .zero)
        view.addSubview(checkBox)
        checkBox.snp.makeConstraints {
            $0.top.equalTo(fieldsStack.snp.bottom).offset(50)
            $0.bottom.width.lessThanOrEqualTo(scrollContentGuide)
            $0.centerX.equalTo(scrollContentGuide)
        }
        checkBox.label.text = "Gostaria de cadastrar meu email"
    }
    
    private func makeButton() {
        button = Button(title: "Enviar")
        scrollView.addSubview(button)
        button.snp.makeConstraints {
            $0.top.equalTo(checkBox.snp.bottom).offset(38)
            $0.width.bottom.lessThanOrEqualTo(scrollContentGuide)
            $0.centerX.equalTo(scrollContentGuide)
        }
    }
    
}
