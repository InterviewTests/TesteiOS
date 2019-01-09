//
//  UICheckBoxCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class UICheckBoxCell: BaseCell {
    
    //// Indicates if the user wants to register his/her email
    let switchEmail: UISwitch = {
        let switchEmail = UISwitch()
        switchEmail.isOn = false
        switchEmail.onTintColor = .red
        switchEmail.translatesAutoresizingMaskIntoConstraints = false
        return switchEmail
    }()
    
    /// Label to display the text for the switch
    let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Desejo cadastrar meu email"
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(switchLabel)
        self.contentView.addSubview(switchEmail)
        
        topSpacing = switchEmail.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        NSLayoutConstraint.activate([
            topSpacing!,
            switchEmail.widthAnchor  .constraint(equalToConstant: 50),
            switchEmail.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            
            switchLabel.centerYAnchor .constraint(equalTo: switchEmail.centerYAnchor),
            switchLabel.leadingAnchor .constraint(equalTo: switchEmail.trailingAnchor, constant: 5),
            switchLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
            switchLabel.bottomAnchor  .constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets up the cell
    func setupCell(_ item:FormItem, callback:((_ isSelected: Bool, _ item:FormItem)->())? = nil){
        setupTopSpace(item)
        
        self.item     = item
        self.callback = callback
        
        switchLabel.text = item.message
        switchEmail.addTarget(self, action: #selector(switchChanged), for: UIControl.Event.valueChanged)
    }
    
    /// Callback to notify the Controller when the switch activated
    private var callback:((_ isSelected: Bool, _ item:FormItem)->())?
    @objc private func switchChanged(mySwitch: UISwitch) {
        guard let item = item else { return }
        callback?(mySwitch.isOn, item)
    }
}
