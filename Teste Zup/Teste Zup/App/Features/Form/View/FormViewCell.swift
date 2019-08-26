//
//  FormView.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FormViewCell: UITableViewCell {
    
    var formViewModel: FormViewModel? {
        
        didSet {
            switch formViewModel?.form?.cells?[formViewModel?.row ?? 1].type {
            case 1:
                setupView(viewWillAdd: textField)
                textField.placeholder = formViewModel?.form?.cells?[formViewModel?.row ?? 1].message
            case 2:
                setupView(viewWillAdd: titleLabel)
                titleLabel.text = formViewModel?.form?.cells?[formViewModel?.row ?? 1].message
            case 4:
                setupView(viewWillAdd: checkBoxView)
                checkBoxView.messageLabel.text = formViewModel?.form?.cells?[formViewModel?.row ?? 1].message
            case 5:
                setupView(viewWillAdd: santanderButton)
                santanderButton.setTitle(formViewModel?.form?.cells?[formViewModel?.row ?? 1].message, for: .normal)
            default:
                 print("")
            }
        }
    }
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        return textField
    }()
    
    let santanderButton = SantaderButton(title: "")
    
    let titleLabel = UILabel(textColor: .lightGray, font: UIFont(name: "Arial", size: 18))
    
    let checkBoxView = CustomCheckBoxView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(viewWillAdd: UIView) {
        addSubviews([viewWillAdd])
        viewWillAdd.fillSuperview()
    }
}
