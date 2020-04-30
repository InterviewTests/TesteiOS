//
//  ContactFormViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol ContactFormTransitionProtocol {
    /// Requests the Success Screen
    func showSuccessScreen()
}
protocol ContactFormViewControllerProtocol: BaseViewControllerProtocol {
    /// Create Message Field
    /// - Parameter cell: cell field
    func configureMessage(cell: CellForm)
    /// Create TextField Field
    /// - Parameter cell: cell field
    func configureTextField(cell: CellForm)
    /// Create CheckBox Field
    /// - Parameter cell: cell field
    func configureCheckBox(cell: CellForm)
    /// Create Button Field
    /// - Parameter cell: cell field
    func configureButton(cell: CellForm)
    
    /// Displays error messages
    /// - Parameter errorMessage: error message
    func showError(errorMessage: String)
}

class ContactFormViewController: BaseViewController, ContactFormViewControllerProtocol {
    // MARK: - Properties
    var stackFormView: UIStackView?
    
    // MARK: - Constants
    let fieldsWidth = UIScreen.main.bounds.width - 60
    
    // MARK: - Interface Properties
    var interactor: ContactFormInteractorProtocol?
    
    // MARK: - Delegate
    var delegate: ContactFormTransitionProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super .viewDidLoad()
        
        configureUI()
        configureData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Private Methods
    fileprivate func configureUI() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        configureStack()
    }
    
    fileprivate func configureStack() {
        stackFormView = UIStackView()
        stackFormView?.axis = .vertical
        stackFormView?.distribution = .equalSpacing
        stackFormView?.alignment = .fill
        stackFormView?.spacing = 20

        stackFormView?.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackFormView!)
        
        stackFormView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackFormView?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    fileprivate func configureData() {
        interactor?.fetchContactList()
    }
    
    // MARK: - Actions
    @objc func sendMessage(_ sender: Any) {
        var sendMessage = true
        
        if let subviews = stackFormView?.arrangedSubviews {
            for field in subviews {
                if field.isKind(of: CustomTextField.self) {
                    guard let textField = field as? CustomTextField else {
                        return
                    }
                    
                    if !textField.isValidField() {
                        sendMessage = false
                    }
                }
            }
            
            if sendMessage {
                delegate?.showSuccessScreen()
                
                return
            }
            
            displayError(errorMessage: "Campos inválidos")
        }
    }
    
    // MARK: - Keyboard Methods
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
    
    // MARK: - ContactFormViewControllerProtocol
    func configureMessage(cell: CellForm) {
         addFormSeparator(separatorHeight: cell.topSpacing)
        
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fieldsWidth, height: 30))
        
        messageLabel.text = cell.message
        messageLabel.numberOfLines = 0
        
        messageLabel.font = FontUtils.regularDescription
        messageLabel.textColor = #colorLiteral(red: 0.5920000076, green: 0.5920000076, blue: 0.5920000076, alpha: 1)
        
        stackFormView?.addArrangedSubview(messageLabel)
    }
    
    func configureTextField(cell: CellForm) {
        addFormSeparator(separatorHeight: cell.topSpacing)
        
        let textField = CustomTextField(frame: CGRect(x: 0, y: 0, width: fieldsWidth, height: 46))
        textField.setup(placeHolderText: cell.message, inputType: cell.getCellTypeField(), isRequired: cell.cellRequired)

        stackFormView?.addArrangedSubview(textField)

        textField.widthAnchor.constraint(equalToConstant: fieldsWidth).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }
    
    func configureCheckBox(cell: CellForm) {
         addFormSeparator(separatorHeight: cell.topSpacing)
        
        let checkBox = CustomCheckBox(frame: CGRect(x: 0, y: 0, width: fieldsWidth, height: 21))
        checkBox.setup(checkBoxText: cell.message)

        stackFormView?.addArrangedSubview(checkBox)
        
        checkBox.widthAnchor.constraint(equalToConstant: fieldsWidth).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    func configureButton(cell: CellForm) {
        addFormSeparator(separatorHeight: cell.topSpacing)
        
        let button = RedRoundedButton(frame: CGRect(x: 0, y: 0, width: fieldsWidth, height: 50))
        
        stackFormView?.addArrangedSubview(button)
        button.widthAnchor.constraint(equalToConstant: fieldsWidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.setup(title: cell.message)
        
        button.addTarget(self, action: #selector(sendMessage(_:)), for: .touchUpInside)
    }
    
    fileprivate func addFormSeparator(separatorHeight: Int) {
        let separatorView = UIView(frame: .zero)
        
        stackFormView?.addArrangedSubview(separatorView)
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.heightAnchor.constraint(equalToConstant: CGFloat(fieldsWidth)).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: CGFloat(separatorHeight)).isActive = true
    }
    
    func showError(errorMessage: String) {
        showErrorMessage(errorMessage: errorMessage)
    }
}
