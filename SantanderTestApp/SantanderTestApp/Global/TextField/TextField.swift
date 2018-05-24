//
//  TextField.swift
//  SantanderTestApp
//
//  Created by Frederico Franco on 19/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import Foundation
import UIKit

struct TextFieldAppearance {
    
    var titleTextColor: UIColor
    var titleTextBigFont: UIFont
    var titleTextSmallFont: UIFont
    
    var providedTextColor: UIColor
    var textFieldCarrierColor: UIColor
    
    var normalLineColor: UIColor
    var errorLineColor: UIColor
    var validLineColor: UIColor
}



// MARK: - TextField

@IBDesignable class TextField: UIView {
    
    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lineView: UIView!
    
    /// user can interact with this view to clear the provided text
    @IBOutlet weak var clearTypedTextView: UIView!
    
    // MARK: Properties
    
    var model: TextFieldModel! {
        didSet {
            render(model)
        }
    }
    
    var appearance = TextFieldAppearance(titleTextColor: ._grey,
                                         titleTextBigFont: R.font.dinProRegular(size: 16)!,
                                         titleTextSmallFont: R.font.dinProRegular(size: 11)!,
                                         providedTextColor: ._black,
                                         textFieldCarrierColor: ._blue,
                                         normalLineColor: ._lightGrey,
                                         errorLineColor: ._vividRed,
                                         validLineColor: ._green) {
        didSet {
            updateAppearance()
        }
    }
    
    // MARK: Init
    
    init(model: TextFieldModel) {
        super.init(frame: .zero)
        
        commonInit()
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        let v = R.nib.textField.firstView(owner: self)!
        self.addSubview(v)
        v.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        model = TextFieldModel(title: "Testando", typedText: "Testando")
        
        updateAppearance()
        
        textField.delegate = self
    }
    
    // MARK: Core
    
    private func render(_ model: TextFieldModel) {
        titleLabel.text = model.title
        textField.text = model.typedText
        
        let hasSomeTypedText = !model.typedText.isEmpty
        if hasSomeTypedText {
            titleLabel.font = appearance.titleTextSmallFont
            textField.isHidden = false
            clearTypedTextView.isHidden = false
        } else {
            if model.isTextFieldActive {
                titleLabel.font = appearance.titleTextSmallFont
                textField.isHidden = false
            } else {
                titleLabel.font = appearance.titleTextBigFont
                textField.isHidden = true
            }
            clearTypedTextView.isHidden = true
        }
        
        if let isValid = model.validation.isValid() {
            lineView.backgroundColor = isValid ? appearance.validLineColor : appearance.errorLineColor
        } else {
            lineView.backgroundColor = appearance.normalLineColor
        }
    }
    
    func updateAppearance() {
        let a = appearance
        titleLabel.textColor = a.titleTextColor
        textField.textColor = a.providedTextColor
        textField.tintColor = a.textFieldCarrierColor
    }
    
    // MARK: IBActions
    
    @IBAction func activateTextField(_ sender: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
    
    @IBAction func didTapToClearText(_ sender: UITapGestureRecognizer) {
        model.clearTypedText()
    }
    
}

extension TextField: UITextFieldDelegate {
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        model.isTextFieldActive = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text = textField.text ?? ""
        if let r = Range.init(range, in: text) {
            text.replaceSubrange(r, with: string)
        }
        
        let _ = try? model.changeTypedText(with: text)
        
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model.isTextFieldActive = false
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let _ = try? model.validateTypedText()
    }
}
