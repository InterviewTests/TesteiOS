//
//  ContactFormViewController.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit

protocol ContactFormViewControllerProtocol {
    func configureMessage(cell: CellForm)
    func configureTextField(cell: CellForm)
    func configureCheckBox(cell: CellForm)
    func configureButton(cell: CellForm)
}

class ContactFormViewController: UIViewController, ContactFormViewControllerProtocol {
    // MARK: - Properties
    @IBOutlet weak var stackFormView: UIStackView!
    
    // MARK: - Interface Properties
    var interactor: ContactFormInteractorProtocol?
    
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
    }
    
    fileprivate func configureData() {
        interactor?.fetchContactList()
    }
    
    // MARK: - ContactFormViewControllerProtocol
    func configureMessage(cell: CellForm) {
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(stackFormView.frame.size.width), height: cell.topSpacing))
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: Int(stackFormView.frame.size.width), height: 30))
        messageLabel.text = cell.message
        messageLabel.numberOfLines = 0
        
        spacerView.heightAnchor.constraint(equalToConstant: CGFloat(cell.topSpacing)).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        stackFormView.addArrangedSubview(spacerView)
        stackFormView.addArrangedSubview(messageLabel)
    }
    
    func configureTextField(cell: CellForm) {
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(stackFormView.frame.size.width), height: cell.topSpacing))
        let textField = CustomTextField(frame: CGRect(x: 0, y: 0, width: stackFormView.frame.size.width, height: 46))
        textField.setup(placeHolderText: cell.message, inputType: cell.getCellTypeField())
        
        spacerView.heightAnchor.constraint(equalToConstant: CGFloat(cell.topSpacing)).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        stackFormView.addArrangedSubview(spacerView)
        stackFormView.addArrangedSubview(textField)
    }
    
    func configureCheckBox(cell: CellForm) {
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(stackFormView.frame.size.width), height: cell.topSpacing))
        let textField = CustomCheckBox(frame: CGRect(x: 0, y: 0, width: stackFormView.frame.size.width, height: 21))
        textField.setup(checkBoxText: cell.message)
        
        spacerView.heightAnchor.constraint(equalToConstant: CGFloat(cell.topSpacing)).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        stackFormView.addArrangedSubview(spacerView)
        stackFormView.addArrangedSubview(textField)
    }
    
    func configureButton(cell: CellForm) {
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: Int(stackFormView.frame.size.width), height: cell.topSpacing))
        let button = RedRoundedButton(frame: CGRect(x: 0, y: 0, width: stackFormView.frame.size.width, height: 50))
        button.setup(title: cell.message)
        
        spacerView.heightAnchor.constraint(equalToConstant: CGFloat(cell.topSpacing)).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        stackFormView.addArrangedSubview(spacerView)
        stackFormView.addArrangedSubview(button)
    }
    
    // MARK: - Keyboard Methods
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
}
