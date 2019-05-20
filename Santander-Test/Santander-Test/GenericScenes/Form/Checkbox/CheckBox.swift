//
//  Checkbox.swift
//  Santander-Test
//
//  Created by Matheus Ribeiro on 20/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

protocol CheckBoxDelegate: class {
    func valueDidChange(value: Bool)
}

class CheckBox: UIButton {
    
    var isChecked: Bool = true {
        didSet{
            updateCheckBoxImage()
        }
    }
    weak var delegate: CheckBoxDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .clear
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isChecked.toggle()
        delegate?.valueDidChange(value: isChecked)
    }
    
    private func updateCheckBoxImage() {
        if isChecked {
            setImage(UIImage(named: "checkbox_selected"), for: .normal)
        } else {
            setImage(UIImage(named: "checkbox_unselected"), for: .normal)
        }
    }
    
}
