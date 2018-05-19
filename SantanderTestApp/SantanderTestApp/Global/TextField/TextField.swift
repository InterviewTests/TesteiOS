//
//  TextField.swift
//  SantanderTestApp
//
//  Created by Frederico Franco on 19/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import Foundation
import UIKit

//protocol TextFieldAppearance {
//
//    var titleText: UIColor { get }
//    var providedText: UIColor { get }
//    var normalLine: UIColor { get }
//    var errorLine: UIColor { get }
//    var validLine: UIColor { get }
//    var carrier: UIColor { get }
//}

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

//protocol ViewAppearance {
//    associatedtype AppearanceType
//
//    static var classAppearance: AppearanceType { get set }
//    var myAppearance: AppearanceType? { get set }
//
//    func getAppearance() -> AppearanceType
//}
//
//extension ViewAppearance {
//
//    func getAppearance() -> AppearanceType {
//        if let my = myAppearance {
//            return my
//        } else {
//            return ViewAppearance.classAppearance
//        }
//    }
//}

protocol TextFieldInput {
    
    var title: String { get }
    var typedText: String? { get set }
    var isValid: Bool? { get set }
    
}

struct MockTextFieldInput: TextFieldInput {
    
    var title: String
    var typedText: String?
    var isValid: Bool?
}

protocol TextFieldValidator {
    
    var maximalTextLength: Int { get }
    func isValidText(_ text: String) -> Bool
}

class TextField: UIView {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    @IBOutlet weak var lineView: UIView!
    
    /// user can interact with this view to clear the provided text
    @IBOutlet weak var clearTypedTextView: UIView!
    
    // MARK: Properties
    
    var input: TextFieldInput! {
        didSet {
            render(input)
        }
    }
    
    var validator: TextFieldValidator?
    
    var appearance = TextFieldAppearance(titleTextColor: ._grey, titleTextBigFont: R.font.dinProRegular(size: 16)!, titleTextSmallFont: R.font.dinProRegular(size: 11)!, providedTextColor: ._black, textFieldCarrierColor: ._blue, normalLineColor: ._lightGrey, errorLineColor: ._vividRed, validLineColor: ._green) {
        didSet {
            updateAppearance()
        }
    }
    
    func updateAppearance() {
        let a = appearance
        titleLabel.textColor = a.titleTextColor
        textField.textColor = a.providedTextColor
        textField.tintColor = a.textFieldCarrierColor
    }
    
    private func render(_ input: TextFieldInput) {
        titleLabel.text = input.title
        textField.text = input.typedText
        
        if !isNilOrEmpty(input.typedText) {
            titleLabel.font = appearance.titleTextSmallFont
            clearTypedTextView.isHidden = false
        } else {
            titleLabel.font = appearance.titleTextBigFont
            clearTypedTextView.isHidden = true
        }
        
        if let isValid = input.isValid {
            lineView.backgroundColor = isValid ? appearance.validLineColor : appearance.errorLineColor
        } else {
            lineView.backgroundColor = appearance.normalLineColor
        }
    }
    
    private func isNilOrEmpty(_ str: String?) -> Bool {
        return str == nil || str == ""
    }
    
    @IBAction func didTapToClearText(_ sender: UITapGestureRecognizer) {
        input.typedText = nil
    }
    
    override func prepareForInterfaceBuilder() {
        input = MockTextFieldInput(title: "Testando", typedText: "Testando", isValid: nil)
        updateAppearance()
        
        super.prepareForInterfaceBuilder()
    }
}

// MARK: UITextFieldDelegate

extension TextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text = textField.text ?? ""
        if let r = Range.init(range, in: text) {
            text.replaceSubrange(r, with: string)
        }
        
        if let maxCount = validator?.maximalTextLength {
            let isValid = text.count <= maxCount
            
            if isValid {
                input.typedText = text
            }
            
            return isValid
        } else {
            input.typedText = text
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let text = textField.text ?? ""
        input.typedText = text
        
        if let validator = self.validator {
           input.isValid = validator.isValidText(text)
        }
    }
}
