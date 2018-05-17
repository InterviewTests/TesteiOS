//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 17/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit
import BEMCheckBox

class ContactViewController: UIViewController
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.checkBox.boxType = .square
        self.checkBox.animationDuration = 0.2
        self.checkBox.delegate = self
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
extension  ContactViewController: BEMCheckBoxDelegate
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
