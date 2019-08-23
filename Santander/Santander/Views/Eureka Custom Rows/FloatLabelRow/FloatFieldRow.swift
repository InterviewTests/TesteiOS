//
//  FloatFieldRow.swift
//  Santander
//
//  Created by Orlando Amorim on 11/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit
import Eureka
import TLCustomMask
import SnapKit

// MARK: - FloatLabelCell

public class _FloatLabelCell<T>: Cell<T>, UITextFieldDelegate, TextFieldCell where T: Equatable, T: InputTypeInitiable {
    
    public var textField: UITextField! { return floatLabelTextField }
    
    public enum MaskType {
        case phone
        case none
    }
    
    private lazy var clearButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.addTarget(self, action: #selector(toggleClearButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var customMask = TLCustomMask()
    
    public var clearImage: (on: UIImage?, off: UIImage?) {
        didSet {
            setClearButtonImage()
        }
    }
    
    public var customMaskType: MaskType = .none {
        didSet {
            if customMaskType == .none {
                customMask.formattingPattern = ""
            }
        }
    }
    
    public var topSpacing: CGFloat = 0.0 {
        didSet {
            if let topConstraint = topConstraint {
                topConstraint.update(inset: topSpacing)
            }
        }
    }
    private var topConstraint: Constraint?
    
    required public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy public var floatLabelTextField: FloatLabelTextField = { [unowned self] in
        let floatTextField = FloatLabelTextField()
        floatTextField.translatesAutoresizingMaskIntoConstraints = false
        floatTextField.titleFont = UIFont.santander(type: .regular, with: 11.0)
        floatTextField.font = UIFont.santander(type: .medium, with: 18.0)
        floatTextField.delegate = self
        floatTextField.addTarget(self, action: #selector(_FloatLabelCell.textFieldDidChange(_:)), for: .editingChanged)
        floatTextField.titleTextColour = UIColor.Santander.silverChalice
        floatTextField.titleActiveTextColour = UIColor.Santander.silverChalice
        floatTextField.borderWidth = 1
        floatTextField.borderColor = UIColor.Santander.gallery
        floatTextField.tintColor = UIColor.Santander.havelockBlue
        return floatTextField
    }()
    
    open override func setup() {
        super.setup()
        height = { [weak self] in
            guard let self = self else {
                return 0.0
            }
            return 47.0 + self.topSpacing
        }
        selectionStyle = .none
        setupClearButton()
        setupFloatLabelTextField()
    }
    
    private func setupFloatLabelTextField() {
        contentView.addSubview(floatLabelTextField)
        floatLabelTextField.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            self.topConstraint = make.top.equalToSuperview().inset(self.topSpacing).constraint
            make.leading.trailing.equalToSuperview().inset(40.0)
            make.bottom.equalToSuperview()
        }
    }
    
    open override func update() {
        super.update()
        textLabel?.text = nil
        detailTextLabel?.text = nil
        floatLabelTextField.attributedPlaceholder = NSAttributedString(string: row.title ?? "", attributes: [.foregroundColor: UIColor.Santander.silverChalice,
                                                                                                             .font: UIFont.santander(type: .regular, with: 16.0)])
        floatLabelTextField.text =  row.displayValueFor?(row.value)
        floatLabelTextField.isEnabled = !row.isDisabled
        floatLabelTextField.alpha = row.isDisabled ? 0.6 : 1
        setClearButtonImage()
    }
    
    private func setupClearButton() {
        clearImage = (on: UIImage(named: "clear-icon"), off: nil)
        textField.clearButtonMode = .never
        floatLabelTextField.rightViewMode = .always
        floatLabelTextField.rightView = clearButton
    }
    
    @objc
    private func toggleClearButton() {
        textField.text = customMask.formatString(string: "")
        row.value = nil
        row.updateCell()
        setClearButtonImage()
    }
    
    private func setClearButtonImage() {
        let image = textField.text != nil ? (textField.text!.isEmpty ? clearImage.off : clearImage.on) : clearImage.off
        clearButton.setImage(image, for: .normal)
        clearButton.setImage(image, for: .highlighted)
    }
    
    /// Returns the value withou mask
    func cleanText() -> String {
        return customMask.cleanText
    }
    
    open override func cellCanBecomeFirstResponder() -> Bool {
        return !row.isDisabled && floatLabelTextField.canBecomeFirstResponder
    }
    
    open override func cellBecomeFirstResponder(withDirection direction: Direction) -> Bool {
        return floatLabelTextField.becomeFirstResponder()
    }
    
    open override func cellResignFirstResponder() -> Bool {
        return floatLabelTextField.resignFirstResponder()
    }
    
    @objc public func textFieldDidChange(_ textField: UITextField) {
        guard let textValue = textField.text else {
            row.value = nil
            return
        }
        if let fieldRow = row as? FormatterConformance, let formatter = fieldRow.formatter {
            if fieldRow.useFormatterDuringInput {
                let value: AutoreleasingUnsafeMutablePointer<AnyObject?> = AutoreleasingUnsafeMutablePointer<AnyObject?>.init(UnsafeMutablePointer<T>.allocate(capacity: 1))
                let errorDesc: AutoreleasingUnsafeMutablePointer<NSString?>? = nil
                if formatter.getObjectValue(value, for: textValue, errorDescription: errorDesc) {
                    row.value = value.pointee as? T
                    if var selStartPos = textField.selectedTextRange?.start {
                        let oldVal = textField.text
                        textField.text = row.displayValueFor?(row.value)
                        if let f = formatter as? FormatterProtocol {
                            selStartPos = f.getNewPosition(forPosition: selStartPos, inTextInput: textField, oldValue: oldVal, newValue: textField.text)
                        }
                        textField.selectedTextRange = textField.textRange(from: selStartPos, to: selStartPos)
                    }
                    return
                }
            } else {
                let value: AutoreleasingUnsafeMutablePointer<AnyObject?> = AutoreleasingUnsafeMutablePointer<AnyObject?>.init(UnsafeMutablePointer<T>.allocate(capacity: 1))
                let errorDesc: AutoreleasingUnsafeMutablePointer<NSString?>? = nil
                if formatter.getObjectValue(value, for: textValue, errorDescription: errorDesc) {
                    row.value = value.pointee as? T
                }
                return
            }
        }
        guard !textValue.isEmpty else {
            row.value = nil
            return
        }
        guard let newValue = T.init(string: textValue) else {
            row.value = nil
            return
        }
        row.value = nil
        row.value = newValue
        row.updateCell()
    }
    
    // MARK: - Helpers
    
    private func displayValue(useFormatter: Bool) -> String? {
        guard let v = row.value else { return nil }
        if let formatter = (row as? FormatterConformance)?.formatter, useFormatter {
            return textField?.isFirstResponder == true ? formatter.editingString(for: v) : formatter.string(for: v)
        }
        let text = String(describing: v)
        if customMaskType != .none {
            return customMask.formatString(string: text)
        } else {
            return text
        }
    }
    
    // MARK: - TextFieldDelegate
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        formViewController()?.beginEditing(of: self)
        if let fieldRowConformance = row as? FormatterConformance, fieldRowConformance.formatter != nil, fieldRowConformance.useFormatterOnDidBeginEditing ?? fieldRowConformance.useFormatterDuringInput {
            textField.text = displayValue(useFormatter: true)
        } else {
            textField.text = displayValue(useFormatter: false)
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        formViewController()?.endEditing(of: self)
        formViewController()?.textInputDidEndEditing(textField, cell: self)
        textFieldDidChange(textField)
        textField.text = displayValue(useFormatter: (row as? FormatterConformance)?.formatter != nil)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        setClearButtonImage()
        switch customMaskType {
        case .phone:
            return managePhoneMask(textField, shouldChangeCharactersIn: range, replacementString: string)
        default:
            return true
        }
    }
}

extension _FloatLabelCell {
    private func managePhoneMask(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as NSString? else { return true }
        var newText = text.replacingCharacters(in: range, with: string)
        if newText.count >= 15 {
            customMask.formattingPattern = "($$) $$$$$-$$$$"
        } else {
            customMask.formattingPattern = "($$) $$$$-$$$$"
        }
        newText = customMask.formatString(string: newText)
        guard let newValue = T.init(string: newText) else {
            row.value = nil
            return false
        }
        row.value = newValue
        textField.text = newText
        setClearButtonImage()
        return false
    }
}

// MARK: - FloatLabelRow
open class FloatFieldRow<Cell: CellType>: FormatteableRow<Cell> where Cell: BaseCell, Cell: TextFieldCell {
    public required init(tag: String?) {
        super.init(tag: tag)
    }
}
