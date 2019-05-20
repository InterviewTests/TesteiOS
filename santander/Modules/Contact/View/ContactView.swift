//
//  ContactView.swift
//  santander
//
//  Created by Jonatha Lima on 20/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class ContactView: UIView {
    
    private lazy var nameField: SATextField = {
        let field = SATextField(titled: "Nome completo")
        return field
    }()
    
    private lazy var emailField: SATextField = {
        let field = SATextField(titled: "Email")
        return field
    }()
    
    private lazy var phoneField: SATextField = {
        let field = SATextField(titled: "Telefone")
        return field
    }()
    
    private lazy var checkboxStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 9
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var checkboxView: SACheckbox = {
        let checkbox = SACheckbox()
        return checkbox
    }()
    
    private lazy var checkboxLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 16)
        label.textColor = .lightGray
        label.text = "Gostaria de cadastrar meu email"
        return label
    }()
    
    public lazy var sendButton: SAButton = {
        let button = SAButton(titled: "Enviar")
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
}

extension ContactView: ViewCoding {
    func insertViews() {
        addSubview(nameField)
        addSubview(emailField)
        addSubview(phoneField)
        addSubview(checkboxStack)
        checkboxStack.addSubview(checkboxView)
        checkboxStack.addArrangedSubview(checkboxLabel)
        addSubview(sendButton)
    }
    
    func setupConstraints() {
        nameField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.top.equalToSuperview().offset(79)
        }
        
        emailField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(nameField.snp.bottom).offset(23)
        }
        
        phoneField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(emailField.snp.bottom).offset(23)
        }
        
        checkboxStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(41)
            make.right.equalToSuperview().inset(41)
            make.top.equalTo(phoneField.snp.bottom).offset(47)
            make.height.equalTo(21)
        }
        
        checkboxView.snp.makeConstraints { make in
            make.height.width.equalTo(19)
        }
        
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(checkboxStack.snp.bottom).offset(38)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
    
    func setupViews() {
        backgroundColor = .white
    }
    
}



