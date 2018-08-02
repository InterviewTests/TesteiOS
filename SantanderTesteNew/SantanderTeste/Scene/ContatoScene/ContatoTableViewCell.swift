//
//  ContatoTableViewCell.swift
//  SantanderTeste
//
//  Created by Nayara on 05/07/2018.
//  Copyright © 2018 Nayara. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import PhoneNumberKit
class ContatoTableViewCell: UITableViewCell,UITextFieldDelegate {

    @IBOutlet weak var checkbutton: UIButton!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var enviar: UIButton!
    @IBOutlet weak var campodeTexto: SkyFloatingLabelTextField!
    
    let phoneNumberKit = PhoneNumberKit()
    var checkStatus = false
    var inserirZero = true
    var nome = false
    
    weak var getObjetos: ContantoViewController!
    
    
    
    var campodeText: Cell!{
        didSet{
            createTextField()
        }
    }
    var messageText: Cell!{
        didSet{
            creatMessage()
        }
    }
    var checkButton: Cell!{
        didSet{
            creatCheckButton()
        }
    }
    
    var enviarButton: Cell!{
        didSet{
            creatEnviarButton()
        }
    }
    var Objeto: ContantoViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
       // Initialization code
        campodeTexto.isHidden = true
        campodeTexto.isEnabled = true
        checkbutton.isHidden = true
        checkbutton.isEnabled = false
        message.isHidden = true
        message.isEditable = false
        enviar.isHidden = true
        enviar.isEnabled = false
      
 
      
    }

  
    func createTextField(){
        campodeTexto.isEnabled = true
        campodeTexto.isHidden = false
        campodeTexto.selectedTitleColor = campodeTexto.placeholderColor
        campodeTexto.clearButtonMode = .whileEditing
        campodeTexto.placeholder = campodeText.message
        campodeTexto.title = campodeText.message
        
        if campodeText.id == 4{
            campodeTexto.keyboardType = .emailAddress
        }else if campodeText.id == 6{
            campodeTexto.keyboardType = .numberPad
        }
    }
    
    func creatMessage(){
        message.isHidden = false
        message.text = messageText.message
    }
    
    func creatCheckButton(){
        checkbutton.isEnabled = true
        checkbutton.isHidden = false
        message.isHidden = false
        message.text = checkButton.message
    }
    
    func creatEnviarButton(){
        enviar.isHidden = false
        enviar.setTitle(enviarButton.message, for: .normal)
    }

    @IBAction func checkAction(_ sender: Any) {
        if checkStatus == false{
            checkStatus = true
            checkbutton.setBackgroundImage(#imageLiteral(resourceName: "Rectangle"), for: .normal)
        }else{
            checkStatus = false
            checkbutton.setBackgroundImage(#imageLiteral(resourceName: "Rectangle 4"), for: .normal)
        }
    }
    
   
    
    
    @IBAction func enivarMensagem(_ sender: Any) {

        getObjetos.viewFeedBack.isHidden = false
    }
  
    @IBAction func validar(_ sender: Any) {
        
        if campodeTexto.keyboardType == .numberPad{
            
           
            campodeTexto.text = Util.shared.formatPhone(phone: campodeTexto.text!)
            
            if campodeTexto.text!.isPhoneNumber{
            
                campodeTexto.lineColor = UIColor.black
                 enviarValidation()
                
            }else{

                campodeTexto.lineColor = UIColor.red
                 enviarInValidation()

            }
        }else if campodeTexto.keyboardType == .emailAddress{
            if Util.shared.isValidEmail(email: campodeTexto.text!){
                
                campodeTexto.lineColor = UIColor.black
                 enviarValidation()
            }else{
                campodeTexto.lineColor = UIColor.red
                 enviarInValidation()
                
            }
        }else{
            if campodeTexto! != nil{
                nome = true
            }else{
                nome = false
            }
        }
    }
    func enviarValidation(){
        if campodeTexto.text!.isPhoneNumber && Util.shared.isValidEmail(email: campodeTexto.text!) && nome{
             enviar.isEnabled = true
        }
    }
    func enviarInValidation(){
        
            enviar.isEnabled = false
        
    }

}

