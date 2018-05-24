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

struct ContactViewControllerModel {
    
    var nameField: TextFieldModel
    var emailField: TextFieldModel
    var phoneField: TextFieldModel
    
}


class ContactViewController: UIViewController {
    
    var model: ContactViewControllerModel
    
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
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor.white
        
        self.scrollView = makeScrollView()
        
        makeTextFields()
    }
    
    private func makeScrollView() -> UIScrollView {
        let s = UIScrollView()
        s.backgroundColor = UIColor.red
        
        self.view.addSubview(s)
        s.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            make.leadingMargin.trailingMargin.equalToSuperview()
        }
        
        let g = UILayoutGuide()
        s.addLayoutGuide(g)
        g.snp.makeConstraints {
            $0.top.bottom.leading.trailing.width.equalTo(s)
        }
        
        scrollContentGuide = g
        
        return s
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
    
}
