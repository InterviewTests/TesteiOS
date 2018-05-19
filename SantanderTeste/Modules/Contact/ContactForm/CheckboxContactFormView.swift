//
//  CheckboxContactFormView.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class CheckboxContactFormView: BaseContactFormView {
    
    private var checkboxView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customDarkGray.cgColor
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var checkboxLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "DINPro-Medium", size: 17) ??
            UIFont.systemFont(ofSize: 17)
        label.textColor = .customDarkGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var isSelected: Bool = false {
        didSet {
            cell?.checkboxValue = isSelected
            
            if isSelected {
                checkboxView.backgroundColor = .customRedOne
            } else {
                checkboxView.backgroundColor = .clear
            }
            
            onActive?(cell?.show, isSelected)
        }
    }
    
    override var cell: ContactFormItem? {
        didSet {
            checkboxLabel.text = cell?.message
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(checkboxView)
        checkboxView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        checkboxView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkboxView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkboxView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(checkboxLabel)
        checkboxLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        checkboxLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        checkboxLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        checkboxLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(selected), for: .touchUpInside)
        
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func selected() {
        isSelected = !isSelected
    }
}
