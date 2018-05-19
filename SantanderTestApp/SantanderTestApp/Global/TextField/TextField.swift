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
    
    var titleText: UIColor
    var providedText: UIColor
    var normalLine: UIColor
    var errorLine: UIColor
    var validLine: UIColor
    var carrier: UIColor
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

protocol TextFieldValidator {
    
    func isValidTextModification(_ text: String) -> Bool
    func isValidText(_ text: String) -> Bool
}

@IBDesignable class TextField: UIView {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
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
    
    var appearance = TextFieldAppearance(titleText: ._grey, providedText: ._black, normalLine: ._lightGrey, errorLine: ._vividRed, validLine: ._green, carrier: ._blue) {
        didSet {
            let a = appearance
            titleLabel.textColor = a.titleText
            textField.textColor = a.providedText
            textField.tintColor = a.carrier
        }
    }
    
    func render(_ input: TextFieldInput) {
        titleLabel.text = input.title
        textField.text = input.typedText
        
        clearTypedTextView.isHidden = input.typedText == nil
        
        if let isValid = input.isValid {
            lineView.backgroundColor = isValid ? appearance.validLine : appearance.errorLine
        } else {
            lineView.backgroundColor = appearance.normalLine
        }
    }
}

extension TextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var text = textField.text ?? ""
        if let r = Range.init(range, in: text) {
            text.replaceSubrange(r, with: string)
        }
        
        return validator?.isValidTextModification(text) ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        var text = textField.text ?? ""
        let isValid = validator?.isValidText(text)
        
    }
}
