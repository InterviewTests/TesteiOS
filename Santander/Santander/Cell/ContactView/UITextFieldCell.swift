//
//  UITextFieldCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class UITextFieldCell: BaseCell {
    
    /// The UILabel
    private let label: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.numberOfLines = 1
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// The UITextField
    private let textField: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textfield.borderStyle = .none
        textfield.clearButtonMode = .whileEditing
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    /// The Divider
    private let divider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(label)
        self.contentView.addSubview(textField)
        self.contentView.addSubview(divider)
        
        topSpacing = label.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        NSLayoutConstraint.activate([
            topSpacing!,
            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            
            textField.heightAnchor .constraint(equalToConstant: 35),
            textField.topAnchor    .constraint(equalTo: label.bottomAnchor, constant: 5),
            textField.bottomAnchor .constraint(equalTo: self.contentView.bottomAnchor),
            textField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            textField.widthAnchor  .constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/1.2),
            
            divider.heightAnchor  .constraint(equalToConstant: 1),
            divider.leadingAnchor .constraint(equalTo: textField.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            divider.bottomAnchor  .constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets up the cell according to the type of the field
    func setupCell(_ item:FormItem){
        setupTopSpace(item)
        self.item = item
        
        switch item.typefield {
            case .email:
                label.text = "Email"
                textField.keyboardType = .emailAddress
            case .telNumber:
                label.text = "Telefone"
                textField.keyboardType = .numberPad
            case .text:
                label.text = "Nome completo"
                textField.keyboardType = .default
            default:
                label.text = ""
        }
        textField.text = item.dataText
        textField.placeholder = item.message
    }
    
}

/// Manage the TextField delegates
extension UITextFieldCell {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let _item = item else { return }
        _item.dataText = textField.text
        
        switch _item.typefield {
            case .text:
                validateName(item?.dataText ?? "")
            case .email:
                validateEmail(item?.dataText ?? "")
            case .telNumber:
                validatePhone(item?.dataText ?? "")
            default:
                return
        }
    }
    
    /// Validates if the text typed is an email
    private func validateEmail(_ email:String){
        if(isEmailValid(email)){
            item?.isSuccess = true
            divider.backgroundColor = .green
        }
        else{
            item?.isSuccess = false
            divider.backgroundColor = .red
        }
    }
    
    /// Regex function to allow only email
    private func isEmailValid(_ email:String)->Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: email)
    }
    
    /// Checks if the text typed has 10 or 11 digits
    private func validatePhone(_ phone:String){
        if(phone.count == 10) || phone.count == 11{
            item?.isSuccess = true
            divider.backgroundColor = .green
        }
        else{
            item?.isSuccess = false
            divider.backgroundColor = .red
        }
    }
    
    /// Checks if the text is not empty
    private func validateName(_ name:String){
        
        if(name.count < 1){
            item?.isSuccess = false
            divider.backgroundColor = .red
        }
        else{
            item?.isSuccess = true
            divider.backgroundColor = .green
        }
    }
}
