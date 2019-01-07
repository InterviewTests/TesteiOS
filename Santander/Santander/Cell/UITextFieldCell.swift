//
//  UITextFieldCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class UITextFieldCell: BaseCell {
    
    /// The UiLabel
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
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(label)
        self.contentView.addSubview(textField)
        
        
        topSpacing = label.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        NSLayoutConstraint.activate([
            textField.heightAnchor .constraint(equalToConstant: 35),
            textField.topAnchor    .constraint(equalTo: label.bottomAnchor, constant: 5),
            textField.bottomAnchor .constraint(equalTo: self.contentView.bottomAnchor),
            textField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            textField.widthAnchor  .constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/1.2),
            
            topSpacing!,
            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(item:FormItem){
        topSpacing?.constant = CGFloat(item.topSpacing ?? 0)
    }
    
}
