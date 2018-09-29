//
//  ContactViewController.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import UIKit
import JVFloatLabeledText

protocol ShowContactLogic {
    
    func displayContactWith(rules: [ShowContact.GetCell.ViewModel.Cell])
}

class ContactViewController: UIViewController, UITextFieldDelegate, ShowContactLogic {
    
    @IBOutlet weak var nameField: JVFloatLabeledTextField!
    @IBOutlet weak var emailField: JVFloatLabeledTextField!
    @IBOutlet weak var phoneField: JVFloatLabeledTextField!
    
    @IBOutlet weak var presentationLabel: UILabel!
    @IBOutlet weak var presentationLabelTop: NSLayoutConstraint!
    @IBOutlet weak var registerEmailLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var nameFieldTop: NSLayoutConstraint!
    @IBOutlet weak var emailFieldTop: NSLayoutConstraint!
    @IBOutlet weak var phoneFieldTop: NSLayoutConstraint!
    
    var interactor: InteractorLogic?
    private let emailFieldID = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup()
    {
        let viewController = self
        let interactor = ContactInteractor()
        let presenter = ContactPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController
        
        interactor.fecthCellsData()
        
        
    }
    
    func displayContactWith(rules: [ShowContact.GetCell.ViewModel.Cell]) {
        
        for cell in rules {
            
            switch cell.id {
            case 1:
                presentationLabel.text = cell.message
                presentationLabel.isHidden = cell.hidden
                presentationLabelTop.constant = CGFloat(cell.topSpacing)
                presentationLabel.tag = cell.id
                
            case 2:
                nameField.placeholder = cell.message
                nameField.isHidden = cell.hidden
                nameFieldTop.constant = CGFloat(cell.topSpacing)
                nameField.tag = cell.id
                
            case 3:
                registerEmailLabel.text = cell.message
                registerEmailLabel.tag = cell.id
                registerEmailLabel.isHidden = cell.hidden
                
                if cell.show == emailFieldID {
                    
                    emailField.isHidden = false
                    emailFieldTop.constant = 35.0
                }
                
            case 4:
                emailField.placeholder = cell.message
                emailField.isHidden = cell.hidden
                emailFieldTop.constant = CGFloat(cell.topSpacing)
                emailField.tag = cell.id
                
            case 6:
                phoneField.placeholder = cell.message
                phoneField.isHidden = cell.hidden
                phoneFieldTop.constant = CGFloat(cell.topSpacing)
                phoneField.tag = cell.id
                
            case 7:
                sendButton.setTitle(cell.message, for: .normal)
                sendButton.tag = cell.id
                
                default:
                    break
            }
        }
    }
}
