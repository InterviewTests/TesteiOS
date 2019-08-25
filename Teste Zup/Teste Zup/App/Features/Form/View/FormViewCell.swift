//
//  FormView.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FormViewCell: UITableViewCell, ConfigurableView {
    
    var formViewModel: FormViewModel? {
        didSet {
            print(formViewModel?.presentationOutput ?? "Deu bode")
            self.textLabel?.text = formViewModel?.form?.cells?[formViewModel?.row ?? 1].message
        }
    }
    
    let fullName: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .black
        return textField
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        addSubviews([fullName])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            ])
    }
    
}
