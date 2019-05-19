//
//  SATextField.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class SATextField: UIView {
    
    public var keyboardType: UIKeyboardType? {
        didSet {
            if let keyboardType = keyboardType {
                inputField.keyboardType = keyboardType
            }
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 16)
        // TODO: Use custom colors
        label.textColor = .gray
        return label
    }()
    
    private lazy var inputField: UITextField = {
        let textField = UITextField()
        textField.font = Resource.Font.medium.of(size: 18)
        // TODO: Use custom colors
        textField.textColor = .black
        textField.tintColor = .blue
        textField.clearButtonMode = .whileEditing
        textField.autocorrectionType = .no
        textField.delegate = self
        return textField
    }()
    
    private lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    init(titled title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SATextField: ViewCoding {
    
    func insertViews() {
        addSubview(inputField)
        addSubview(titleLabel)
        addSubview(bottomLine)
    }
    
    func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.lessThanOrEqualToSuperview()
            make.height.equalTo(21)
        }
        
        inputField.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(bottomLine.snp.top)
            make.height.greaterThanOrEqualTo(55)
        }
        
        bottomLine.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
}

extension SATextField {
    
    public func getText() -> String {
        return inputField.text ?? ""
    }
    
    public func setText(_ text: String) {
        inputField.text = text
    }
    
}

private extension SATextField {
    
    func didBeginEditing() {
        bottomLine.backgroundColor = .gray
        titleLabel.font = Resource.Font.regular.of(size: 11)
        titleLabel.snp.updateConstraints { update in
            update.height.equalTo(11)
        }
        // TODO: Animate constraints update
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        })
    }
    
    func didClearField() {}
    
    func didFinishEditing() {
        bottomLine.backgroundColor = .lightGray
        titleLabel.font = Resource.Font.regular.of(size: 16)
        titleLabel.snp.updateConstraints { update in
            update.height.equalTo(21)
        }
    }
    
}

extension SATextField: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        guard let text = textField.text, text.isEmpty else {
            return
        }
        
        didBeginEditing()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text, text.isEmpty else {
            return
        }
        
        didFinishEditing()
        
    }
    
}
