//
//  FundosContatoViewController.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit
import JMMaskTextField_Swift
import DLRadioButton

protocol FundosContatoDisplayLogic: class {
}

class FundosContatoViewController: UIViewController, FundosContatoDisplayLogic {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: JMMaskTextField!
    @IBOutlet weak var mailCheckbox: DLRadioButton!
    @IBOutlet weak var beforeMessageContainerView: UIView!
    @IBOutlet weak var afterMessageContainerView: UIView!
    
    final private let emailValidator = StringEmailValidator()
    final private let phoneValidator = StringTelValidator()
    
    var interactor: FundosContatoInteractor?
    var router: (NSObjectProtocol & FundosContatoRoutingLogic & FundosContatoDataPassing)?
    
    //    MARK: - Object Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = FundosContatoInteractor()
        let presenter = FundosContatoPresenter()
        let router = FundosContatoRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.navigationItem.rightBarButtonItem = nil
        tabBarController?.navigationItem.title = "Contato"
    }
    
    //    MARK: - Config
    func configSubviews(){
        nameTextField.setBottomLine()
        nameTextField.delegate = self
        
        emailTextField.setBottomLine()
        emailTextField.delegate = self
        
        phoneTextField.setBottomLine()
        phoneTextField.delegate = self
        phoneTextField.maskString = "(00) 0000-00000"
        
        mailCheckbox.isMultipleSelectionEnabled = true
    }
    
    //    MARK: - Action
    @IBAction func sendButtonTouched(_ sender: Any) {
        //Código temporário.
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let phone = phoneTextField.text ?? ""
        
        var error: NSError?
        if name.count < 1 {
            error = NSError()
            nameTextField.layer.shadowColor = UIColor.Default.red.cgColor
        }
        
        if email.count < 1 || !emailValidator.validate(text: email){
            error = NSError()
            emailTextField.layer.shadowColor = UIColor.Default.red.cgColor
        }
        
        if phone.count < 1 || !phoneValidator.validate(text: phone) {
            error = NSError()
            phoneTextField.layer.shadowColor = UIColor.Default.red.cgColor
        }
        
        if error != nil {
            showAlert(message: "Favor preencher todos os campos")
            return
        }
        //Fim código temporário
        
        UIView.animate(withDuration: 0.2) {
            self.beforeMessageContainerView.alpha = 0
            self.afterMessageContainerView.alpha = 1
        }
    }
    
    @IBAction func sendNewMessageButtonTouched(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.beforeMessageContainerView.alpha = 1
            self.afterMessageContainerView.alpha = 0
            
            self.nameTextField.text = ""
            self.emailTextField.text = ""
            self.phoneTextField.text = ""
        }
    }
}
extension FundosContatoViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let nsText = NSString(string: textField.text ?? "")
        let newText = nsText.replacingCharacters(in: range, with: string)
        
        switch textField.tag {
        case nameTextField.tag:
            textField.layer.shadowColor = newText.count > 0 ? UIColor.green.cgColor : UIColor.Default.red.cgColor
            break
            
        case emailTextField.tag:
            textField.layer.shadowColor = emailValidator.validate(text: newText) ? UIColor.green.cgColor : UIColor.Default.red.cgColor
            break
            
        case phoneTextField.tag:
            textField.layer.shadowColor = phoneValidator.validate(text: newText) ? UIColor.green.cgColor : UIColor.Default.red.cgColor
            break
            
        default:
            break
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let tag = textField.tag + 1
        if let textField = view.viewWithTag(tag) as? UITextField {
            textField.becomeFirstResponder()
        }
        
        return true
    }
}
