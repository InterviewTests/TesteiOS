//
//  UnderLineTextField.swift
//  UnderLineTextField
//
//  Created by Mohammad Ali Jafarian on 16/10/17.
//  Copyright © 2017 Mohammad Ali Jafarian. All rights reserved.
//

import UIKit
import QuartzCore

/// Simple UITextfield Subclass with state
@IBDesignable
open class UnderLineTextField: UITextField {
    private var isLayoutCalled = false
    //============
    // MARK: - inits
    //============
    override init(frame: CGRect) {
        super.init(frame: frame)
        initilize()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initilize()
    }
    private func initilize() {
        neededConstraint.append(heightConstraint)
        borderStyle = .none
        placeholder = super.placeholder
        tintColor = super.tintColor
        super.placeholder = nil
        clearButtonMode = super.clearButtonMode
        placeholderLabel.text = placeholder
        errorLabel.text = ""
        addTarget(self, action: #selector(self.formTextFieldDidBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(self.formTextFieldDidEndEditing), for: .editingDidEnd)
        addTarget(self, action: #selector(self.formTextFieldValueChanged), for: [.editingChanged, .valueChanged])
        NSLayoutConstraint.activate(neededConstraint)
        adjustHeight()
        errorLabel.alpha = 0
        text = super.text
    }

    //=================
    // MARK: - Variables
    //=================
    /// current status of control (can be normal, warning, error)
    open var status: UnderLineTextFieldStatus = .normal {
        didSet {
            switch status {
            case .error, .warning:
                changeErrorLabelVisibilty(visible: true)
            default:
                changeErrorLabelVisibilty(visible: false)
            }
            setNeedsDisplay()
        }
    }

    /// current focus status of textfield (can be active, inactive)
    open var focusStatus: UnderLineTextFieldFocusStatus = .inactive {
        didSet {
            setNeedsDisplay()
        }
    }

    /// current content status of textfield (can be empty, filled)
    open var contentStatus: UnderLineTextFieldContentStatus = .empty {
        didSet {
            guard contentStatus != oldValue else {
                return
            }
            layoutIfNeeded()
            if contentStatus == .empty {
                setPlaceholderPlace(isUp: false, isAnimated: true)
            } else {
                setPlaceholderPlace(isUp: true, isAnimated: true)
            }
            setNeedsDisplay()
        }
    }

    /// validation time type
    open var validationType: UnderLineTextFieldValidateType = .afterEdit

    /// animation duration for changing states
    open var animationDuration: Double = 0.3
    /// constraints that will be activated upon initilization
    private var neededConstraint = [NSLayoutConstraint]()
    /// should show error label
    private var errorLabelColor: UIColor {
        switch self.status {
        case .warning:
            return warningTextColor
        default:
            return errorTextColor
        }
    }
    /// current color of control base on it's status
    private var lineColor: UIColor {
        switch (status, contentStatus, focusStatus) {
        case (.normal, _, .inactive):
            return inactiveLineColor
        case (.normal, _, .active):
            return activeLineColor
        case ((.error,_,_)):
            return errorLineColor
        case ((.warning,_,_)):
            return warningLineColor
        default:
            return inactivePlaceholderTextColor
        }
    }
    /// current width of control line base on it's status
    private var lineWidth: CGFloat {
        switch (status, contentStatus, focusStatus) {
        case (.normal, _, .inactive):
            return inactiveLineWidth
        case (.normal, _, .active):
            return activeLineWidth
        case ((.error,_,_)):
            return errorLineWidth
        case ((.warning,_,_)):
            return warningLineWidth
        default:
            return inactiveLineWidth
        }
    }

    /// text color of placeholder
    var placeholderColor: UIColor! {
        switch (status, contentStatus, focusStatus) {
        case (.normal, .filled, _):
            return activePlaceholderTextColor
        case (.normal, .empty, _):
            return inactivePlaceholderTextColor
        case ((.error,_,_)):
            return errorPlaceholderColor
        case ((.warning,_,_)):
            return warningPlaceholderColor
        default:
            return inactivePlaceholderTextColor
        }
    }

    //=====================
    // MARK: Lazy Loadings
    //=====================
    /// set height of control
    private lazy var heightConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: self,
                                  attribute: .height,
                                  relatedBy: .equal,
                                  toItem: nil,
                                  attribute: .notAnAttribute,
                                  multiplier: 1,
                                  constant: 0)
    }()
    private lazy var clearButton: UIButton = {
        let button = UIButton(type: .custom)
        let bundle = Bundle.init(for: UnderLineTextField.self)
        let clearImage = UIImage(named: "Clear",
                                 in: bundle,
                                 compatibleWith: nil)
        button.setImage(clearImage, for: .normal)
        button.setImage(clearImage, for: .highlighted)
        button.addTarget(self, action: #selector(self.clearText), for: .touchUpInside)
        button.tintColor = tintColor
        button.sizeToFit()
        rightView = button
        return button
    }()
    /// layer which line will be drawn on it
    private lazy var lineLayer: CAShapeLayer = {
        let layer = CAShapeLayer(layer: self.layer)
        layer.lineCap = kCALineCapRound
        layer.strokeColor = lineColor.cgColor
        layer.lineWidth = lineWidth
        return layer
    }()
    /// label for displaying error
    private lazy var errorLabel: UIAnimatableLabel = {
        let label = UIAnimatableLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.animationDuration = animationDuration
        if let fontName = font?.familyName, let size = font?.pointSize {
            label.font = UIFont(name: fontName, size: size * 0.8)
        }
        addSubview(label)
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 0))
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .bottom,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .bottom,
                                                   multiplier: 1,
                                                   constant: 0))
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .trailing,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .trailing,
                                                   multiplier: 1,
                                                   constant: 0))
        return label
    }()

    /// label for displaying placeholder
    private lazy var placeholderLabel: UIAnimatableLabel = {
        let label = UIAnimatableLabel()
        label.font = self.font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.animationDuration = animationDuration
        addSubview(label)
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1,
                                                   constant: 0))
        neededConstraint.append(NSLayoutConstraint(item: label,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0))
        return label
    }()

    //===================
    // MARK: IBInspectable
    //===================
    //==================
    // MARK: Active State
    //==================
    /// line width when textfield is focused
    @IBInspectable open var activeLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != activeLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield is focused
    @IBInspectable open var activePlaceholderTextColor: UIColor = .lightGray {
        didSet {
            if oldValue != activePlaceholderTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield is focused
    @IBInspectable open var activeLineColor: UIColor = .darkText {
        didSet {
            if oldValue != activeLineColor {
                setNeedsDisplay()
            }
        }
    }

    //====================
    // MARK: Inactive Satuts
    //====================
    /// line width when textfield is not focused
    @IBInspectable open var inactiveLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != inactiveLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield is not focused
    @IBInspectable open var inactivePlaceholderTextColor: UIColor = .darkText {
        didSet {
            if oldValue != inactivePlaceholderTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield is not focused
    @IBInspectable open var inactiveLineColor: UIColor = .lightGray {
        didSet {
            if oldValue != inactiveLineColor {
                setNeedsDisplay()
            }
        }
    }

    //====================
    // MARK: Warning Status
    //====================
    /// line width when textfield have warning
    @IBInspectable open var warningLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != warningLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield have warning
    @IBInspectable open var warningPlaceholderColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningPlaceholderColor {
                setNeedsDisplay()
            }
        }
    }
    /// warrning label color when textfield have warning
    @IBInspectable open var warningTextColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield have warning
    @IBInspectable open var warningLineColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningLineColor {
                errorLabel.textColor = errorLineColor
                setNeedsDisplay()
            }
        }
    }

    //==================
    // MARK: Error Status
    //==================
    /// line width when textfield have error
    @IBInspectable open var errorLineWidth: CGFloat = 1 {
        didSet {
            if oldValue != errorLineWidth {
                setNeedsDisplay()
            }
        }
    }
    /// placeholder color when textfield have error
    @IBInspectable open var errorPlaceholderColor: UIColor = UIColor.red {
        didSet {
            if oldValue != errorPlaceholderColor {
                setNeedsDisplay()
            }
        }
    }
    /// error label color when textfield have warning
    @IBInspectable open var errorTextColor: UIColor = UIColor.yellow {
        didSet {
            if oldValue != warningTextColor {
                setNeedsDisplay()
            }
        }
    }
    /// line color when textfield have error
    @IBInspectable open var errorLineColor: UIColor = UIColor.red {
        didSet {
            if oldValue != errorLineColor {
                errorLabel.textColor = errorLineColor
                setNeedsDisplay()
            }
        }
    }
}


extension UnderLineTextField {

    //=================
    // MARK: - Overrides
    //=================
    override open var text: String? {
        get {
            return super.text
        }
        set {
            super.text = newValue
            decideContentStatus(fromText: text)
            setNeedsDisplay()
        }
    }

    override open var placeholder: String? {
        set {
            placeholderLabel.text = newValue
        }
        get {
            return placeholderLabel.text
        }
    }

    override open var font: UIFont? {
        set {
            super.font = newValue
            adjustHeight()
            if let fontName = font?.familyName, let size = font?.pointSize {
                errorLabel.font = UIFont(name: fontName, size: size * 0.8)
            }
        }
        get {
            return super.font
        }
    }

    override open var clearButtonMode: UITextFieldViewMode {
        set {
            rightViewMode = newValue
        }
        get {
            return rightViewMode
        }
    }

    override open var tintColor: UIColor! {
        set {
            super.tintColor = newValue
            clearButton.tintColor = newValue
        }
        get {
            return super.tintColor
        }
    }

    open override var semanticContentAttribute: UISemanticContentAttribute {
        get {
            return super.semanticContentAttribute
        }
        set {
            super.semanticContentAttribute = newValue
            changeSementics()
        }
    }

    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        if lineLayer.superlayer == nil {
            layer.addSublayer(lineLayer)
        }
        aniamteLineColor()
        lineLayer.lineWidth = lineWidth
        placeholderLabel.textColor = placeholderColor
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        lineLayer.path = createLinePath().cgPath
        changeSementics()
        isLayoutCalled = true
    }

    override open func becomeFirstResponder() -> Bool {
        focusStatus = .active
        return super.becomeFirstResponder()
    }

    override open func resignFirstResponder() -> Bool {
        focusStatus = .inactive
        return super.resignFirstResponder()
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initilize()
    }
}

//================
// MARK: - Methods
//================
extension UnderLineTextField {

    func changeSementics() {
        if semanticContentAttribute == .forceRightToLeft {
            errorLabel.textLayer.alignmentMode = kCAAlignmentRight
            placeholderLabel.textLayer.alignmentMode = kCAAlignmentRight
        } else {
            errorLabel.textLayer.alignmentMode = kCAAlignmentLeft
            placeholderLabel.textLayer.alignmentMode = kCAAlignmentLeft
        }
    }

    /// change visibilty of error label
    func changeErrorLabelVisibilty(visible: Bool) {
        errorLabel.changeText(toColor: errorLabelColor, animated: true)
        UIView.animate(withDuration: animationDuration,
                       animations: {
                        self.errorLabel.alpha = visible ? 1 : 0
        })
    }

    /// decide if text is empty or not
    private func decideContentStatus(fromText text: String?) {
        if (text ?? "").isEmpty {
            contentStatus = .empty
        } else {
            contentStatus = .filled
        }
    }

    /// adjust height constraint of control base on font size
    private func adjustHeight() {
        let heightLine = (font?.pointSize ?? 0) + 8
        let height =  heightLine + heightLine * 1.6 + 14
        heightConstraint.constant = height
        guard isLayoutCalled else { return }
        layoutIfNeeded()
    }

    /// change placeholder Place
    private func setPlaceholderPlace(isUp: Bool, isAnimated: Bool) {
        if isUp {
            var xTransform = placeholderLabel.bounds.width * 0.15

            xTransform *= semanticContentAttribute == .forceRightToLeft ? 1 : -1
            let label = self.placeholderLabel
            guard isAnimated else {
                placeholderLabel.textColor = placeholderColor
                label.transform = label.transform.scaledBy(x: 0.8, y: 0.8)
                label.transform = label
                    .transform
                    .translatedBy(x: xTransform,
                                  y: label.frame.origin.y * -1)
                return
            }
            UIView.animate(withDuration: animationDuration, animations: {
                label.transform = label.transform.scaledBy(x: 0.8, y: 0.8)
                label.transform = label
                    .transform
                    .translatedBy(x: xTransform,
                                  y: label.frame.origin.y * -1)
            })
        } else {
            guard isAnimated else {
                placeholderLabel.textColor = placeholderColor
                self.placeholderLabel.transform = .identity
                return
            }
            UIView.animate(withDuration: animationDuration, animations: {
                self.placeholderLabel.transform = .identity
            })
            animatePlaceholderColor()
        }
    }
    /// animate linecolor
    private func aniamteLineColor() {
        let animation = CABasicAnimation(keyPath: "strokeColor")
        animation.duration = animationDuration
        animation.isRemovedOnCompletion = true
        lineLayer.add(animation, forKey: "strokeColorChange")
        lineLayer.strokeColor = lineColor.cgColor
    }
    /// animate placeholderColor
    private func animatePlaceholderColor() {
        placeholderLabel.changeText(toColor: placeholderColor,
                                    animated: true)
    }
    /// create line bezier path
    private func createLinePath() -> UIBezierPath {
        let path = UIBezierPath()
        let heightLine = (font?.pointSize ?? 0) + 8
        let padding = heightLine + heightLine * 0.8 + 9
        path.move(to: CGPoint(x: 0, y: padding))
        path.addLine(to: CGPoint(x: bounds.maxX, y: padding))
        return path
    }

    public func validate() throws {
        do {
            try (delegate as? UnderLineTextFieldDelegate)?
                .textFieldValidate(underLineTextField: self)
             status = .normal
        } catch UnderLineTextFieldErrors.error(let message) {
            status = .error
            errorLabel.text = message
            throw UnderLineTextFieldErrors.warning(message: message)
        } catch UnderLineTextFieldErrors.warning(let message) {
            status = .warning
            errorLabel.text = message
            throw UnderLineTextFieldErrors.warning(message: message)
        } catch {
            throw error
        }
        if isFirstResponder {
            focusStatus = .active
        } else {
            focusStatus = .inactive
        }
    }
}

//=================
// MARK: - Selectors
//=================
@objc extension UnderLineTextField {
    /// clear text on control
    private func clearText() {
        guard delegate?.textFieldShouldClear?(self) ?? true else {
            return
        }
        text = ""
        (delegate as? UnderLineTextFieldDelegate)?.textFieldTextChanged(underLineTextField: self)
    }
    /// textfield become first responder
    private func formTextFieldDidBeginEditing() {
        layoutIfNeeded()
        if validationType.contains(.always) {
            try? validate()
        } else {
            focusStatus = .active
        }
    }
    /// textfield resigned first responder
    private func formTextFieldDidEndEditing() {
        layoutIfNeeded()
        if validationType.contains(.afterEdit) ||
            validationType.contains(.onFly) ||
            validationType.contains(.always) {
            try? validate()
        } else {
            focusStatus = .inactive
        }
    }
    /// textfield value changed
    private func formTextFieldValueChanged() {
        (delegate as? UnderLineTextFieldDelegate)?
            .textFieldTextChanged(underLineTextField: self)
        decideContentStatus(fromText: text)
        guard let text = text, !text.isEmpty else {
            if validationType.contains(.onFly) ||
                validationType.contains(.always) {
                try? validate()
            }
            return
        }
        if validationType.contains(.onFly) ||
            validationType.contains(.always) {
            try? validate()
        }
    }
}
