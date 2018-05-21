//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 17/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit
import BEMCheckBox

class LittleContactViewController: UIViewController
{
    //Outlets
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var checkBox: BEMCheckBox!
    
    //Properties
    var isInterested = false
    
    let defaultColor = #colorLiteral(red: 0.8374213576, green: 0.8374213576, blue: 0.8374213576, alpha: 1)
    let grayColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
    let redColor = #colorLiteral(red: 0.968627451, green: 0.2901960784, blue: 0.2823529412, alpha: 1)
    let greenColor = #colorLiteral(red: 0.4980392157, green: 0.7921568627, blue: 0.3254901961, alpha: 1)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.checkBox.boxType = .square
        self.checkBox.animationDuration = 0.2
        self.checkBox.delegate = self
        
        self.textFieldName.delegate = self
        self.textFieldEmail.delegate = self
        self.textFieldPhone.delegate = self
        
        self.viewName.backgroundColor = self.defaultColor
        self.viewEmail.backgroundColor = self.defaultColor
        self.viewPhone.backgroundColor = self.defaultColor
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("touchesBegan")
        self.view.endEditing(true)
    }
        
    //MARK: - Actions
    @IBAction func sendContact(_ sender: Button)
    {
        if isInterested
        {
            print("Mostrar view successo")
        }
        else
        {
            print("mostar alerta")
        }
    }
}

//MARK: - BEMCheckBoxDelegate
extension  LittleContactViewController: BEMCheckBoxDelegate
{
    func didTap(_ checkBox: BEMCheckBox)
    {
        if checkBox.on
        {
            print("Selecionou para cadastrar email")
            self.isInterested = true
        }
        else
        {
            print("Não selecionou para cadastrar email")
            self.isInterested = false
        }
    }
}

//MARK: - UITextFieldDelegate
extension LittleContactViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        switch textField
        {
            case self.textFieldName:
                print("name")
                self.viewName.backgroundColor = self.grayColor
                self.labelName.font = UIFont(name: self.labelName.font.fontName, size: 22)
            case self.textFieldEmail:
                print("email")
                self.viewEmail.backgroundColor = self.redColor
                self.labelEmail.font = UIFont(name: self.labelName.font.fontName, size: 22)
            default:
                print("phone")
                self.viewPhone.backgroundColor = self.greenColor
                self.labelPhone.font = UIFont(name: self.labelName.font.fontName, size: 22)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        switch textField
        {
            case self.textFieldName:
                print("nameEnd")
                self.labelName.font = UIFont(name: self.labelName.font.fontName, size: 16)
                if self.textFieldName.text != ""
                {
                    self.viewName.backgroundColor = self.grayColor
                }
                else
                {
                    self.viewName.backgroundColor = self.defaultColor
                }
            case self.textFieldEmail:
                print("emailEnd")
                self.labelEmail.font = UIFont(name: self.labelName.font.fontName, size: 16)
                if self.textFieldEmail.text != ""
                {
                    self.viewEmail.backgroundColor = self.redColor
                }
                else
                {
                    self.viewEmail.backgroundColor = self.defaultColor
                }
            default:
                print("phoneEnd")
                self.labelPhone.font = UIFont(name: self.labelName.font.fontName, size: 16)
                if self.textFieldPhone.text != ""
                {
                    self.viewPhone.backgroundColor = self.greenColor
                }
                else
                {
                    self.viewPhone.backgroundColor = self.defaultColor
                }
        }
    }
}
