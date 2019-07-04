//
//  ViewController.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 03/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit
import AnimatedTextInput
import JMMaskTextField_Swift
import DLRadioButton

struct CustomTextInputStyle: AnimatedTextInputStyle {
    let placeholderInactiveColor = UIColor.gray
    let activeColor = UIColor.orange
    let inactiveColor = UIColor.gray.withAlphaComponent(0.3)
    let lineInactiveColor = UIColor.gray.withAlphaComponent(0.3)
    let lineActiveColor = UIColor.green
    let lineHeight: CGFloat = 3
    let errorColor = UIColor.red
    var textInputFont = UIFont(name: "DINPro-Regular", size: 14)!
    let textInputFontColor = UIColor.black
    let placeholderMinFontSize: CGFloat = 9
    let counterLabelFont: UIFont? = UIFont(name: "DINPro-Regular", size: 9)
    let leftMargin: CGFloat = 25
    let topMargin: CGFloat = 20
    let rightMargin: CGFloat = 0
    let bottomMargin: CGFloat = 10
    let yHintPositionOffset: CGFloat = 7
    let yPlaceholderPositionOffset: CGFloat = 0
    public let textAttributes: [String: Any]? = nil
}


class ViewController: UIViewController {
    //    MARK:- Outlets
    @IBOutlet weak var tfName: AnimatedTextInput!
    @IBOutlet weak var tfEmail: AnimatedTextInput!
    @IBOutlet weak var tfPhone: AnimatedTextInput!
    @IBOutlet weak var btSaveEmail: DLRadioButton!
    
    //    MARK:- Parameters
    fileprivate var isBlue = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        btSaveEmail.isMultipleSelectionEnabled = true
        
        tfName.placeHolderText = "Nome"
        tfName.returnKeyType = .next
        tfName.delegate = self
        
        tfEmail.placeHolderText = "Email"
        tfEmail.type = .email
        tfEmail.returnKeyType = .next
        tfEmail.delegate = self
        
        tfPhone.placeHolderText = "Telefone"
        tfPhone.type = .phone
        tfPhone.returnKeyType = .send
        tfPhone.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func send(_ sender: UIButton) {
        
    }
    @IBAction func check(_ sender: DLRadioButton) {
        sender.isIconOnRight = !sender.isIconOnRight
        print("isSelected: \(sender.isIconOnRight)")
    }
    
}

extension ViewController: AnimatedTextInputDelegate {
    
    func animatedTextInputShouldReturn(animatedTextInput: AnimatedTextInput) -> Bool {
        if animatedTextInput == tfName {
            tfEmail.becomeFirstResponder()
        }
        if animatedTextInput == tfEmail {
            tfPhone.becomeFirstResponder()
        }
        if animatedTextInput == tfPhone {
            print("GOO!!!")
        }
        return true
    }
    
    func animatedTextInputDidChange(animatedTextInput: AnimatedTextInput) {
        if animatedTextInput == tfName {
            animatedTextInput.text = animatedTextInput.text?.capitalized ?? ""
        }
        
        if animatedTextInput == tfPhone {
            if let text = animatedTextInput.text {
                var mask = JMStringMask(mask: "")
                if text.count > 14 {
                    mask = JMStringMask(mask: "(00) 00000-0000")
                }else{
                    mask = JMStringMask(mask: "(00) 0000-0000")
                }
                animatedTextInput.text = mask.mask(string: mask.unmask(string: text))
            }
        }
    }
    
    func animatedTextInputDidEndEditing(animatedTextInput: AnimatedTextInput) {
        
        if animatedTextInput.text!.isEmpty {
            animatedTextInput.show(error: "", placeholderText: animatedTextInput.placeHolderText)
            return
        }
        if animatedTextInput == tfEmail {
            if animatedTextInput.text!.isValidEmail() {
                animatedTextInput.style = CustomTextInputStyle()
            } else {
                animatedTextInput.show(error: "", placeholderText: animatedTextInput.placeHolderText)
            }
        }
        
    }
}
