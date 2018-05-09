//
//  FormViewController.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit
import SVProgressHUD
import JMMaskTextField_Swift

class FormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    //
    // MARK: - SETUP DE VARIÁVEIS LOCAIS
    //
    var formFields = FormModel()
    let URL_Form_Contato = "https://floating-mountain-50292.herokuapp.com/cells.json"
    var titulo = ""

    //
    // MARK: - SETUP DE GANCHOS IBOUTLET
    //
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Label_Titulo: UILabel!
    
    //
    //  MARK: - FUNÇÕES STANDARD DO VIEWCONTROLLER
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        // setup de gesture recognizer para ocultar teclado
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        // ajusta o estilo do SVProgressHUD para dark
        SVProgressHUD.setDefaultStyle(.dark)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Label_Titulo.text = titulo

        // se ainda não carregou o JSON de formulário
        if formFields.ElementosForm.count == 0 
        {
            fetchFormFields(forURL: URL_Form_Contato, completionHandler: { (resultado, mensagem) in
                if !resultado
                {
                    DispatchQueue.main.async {
                        self.showAlert(title: "Erro", body: "Não foi possível carregar o JSON do form de contato.", buttonText: "OK")
                    }
                }
            })
        }
    }
    
    override func viewDidLayoutSubviews() {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // MARK: - TABLEVIEW DELEGATE FUNCTIONS
    //

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return formFields.ElementosForm.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        let thisFormField = formFields.ElementosForm[row]
        
        // Customiza a altura da célula de acordo com o seu tipo
        switch thisFormField.type
        {
        case 1: // campo para data entry
            return CGFloat(70)
        case 2: // display de texto
            return CGFloat(44)
        case 3: // imagem
            return CGFloat(44)
        case 4: // campo para checkbox
            return CGFloat(50)
        case 5: // botão de enviar
            return CGFloat(100)
        default:
            return CGFloat(44)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FormCell", for: indexPath) as UITableViewCell
        let row = indexPath.row
        let thisFormField = formFields.ElementosForm[row]
        
        // remove todas as subviews e observers da célula
        for subView in cell.subviews
        {
            subView.removeFromSuperview()
        }
        
        // configura o conteúdo da cell de acordo com o tipo de campo do formulário
        switch thisFormField.type
        {
        case 1: // campo para data entry
            
            // LABEL DO CAMPO
            let thisLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
            thisLabel.textAlignment = .left
            thisLabel.textColor = UIColor.lightGray
            thisLabel.font = UIFont(name: "DINPro-Regular", size: 16)
            thisLabel.text = thisFormField.message
            
            // CAMPO PARA DATA ENTRY
            let thisTextField = JMMaskTextField(frame: CGRect(x: CGFloat(0), y: CGFloat(20), width: cell.frame.width, height: cell.frame.height))
            thisTextField.font = UIFont(name: "DINPro-Regular", size: 16)
            thisTextField.textColor = UIColor.black
            thisTextField.textAlignment = .left
            thisTextField.borderStyle = .none
            thisTextField.clearButtonMode = .whileEditing
            thisTextField.tag = thisFormField.dataEntry.fieldTag!
            thisTextField.delegate = self

            // customiza máscara e tipo de teclado de acordo com o tipo de campo
            switch thisFormField.typeField
            {
            case 1: // text
                thisTextField.keyboardType = .asciiCapable
            case 2: // phone
                thisTextField.maskString = "(00) 0 0000-0000"
                thisTextField.keyboardType = .numberPad
            case 3: // email
                thisTextField.keyboardType = .emailAddress
            default:
                thisTextField.keyboardType = .asciiCapable
            }
            
            // INDICADOR DE VALIDAÇÃO
            let thisImageView = UIImageView(frame: CGRect(x: CGFloat(0), y: cell.frame.height - 1, width: cell.frame.width, height: 1))
            
            thisImageView.contentMode = .scaleToFill
            thisImageView.image = #imageLiteral(resourceName: "Linha Campo Vazio")
            thisImageView.tag = thisFormField.dataEntry.fieldTag!
            
            cell.addSubview(thisLabel)
            cell.addSubview(thisTextField)
            cell.addSubview(thisImageView)
        case 2: // display de texto
            
            // LABEL DO CAMPO
            let thisLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
            thisLabel.textAlignment = .left
            thisLabel.textColor = UIColor.lightGray
            thisLabel.font = UIFont(name: "DINPro-Regular", size: 16)
            thisLabel.text = thisFormField.message
            thisLabel.tag = thisFormField.dataEntry.fieldTag!
            thisLabel.numberOfLines = 2
            thisLabel.lineBreakMode = .byWordWrapping
            
            cell.addSubview(thisLabel)
            _ = 0
        case 3: // imagem
            _ = 0
        case 4: // campo para checkbox
            
            // CHECKBOX
            let thisImageView = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(18), width: 15, height: 15))
            
            thisImageView.contentMode = .scaleAspectFit
            thisImageView.image = #imageLiteral(resourceName: "Retangulo Off")
            
            // associa um tapgesture ao objeto thisImageView para capturar o tap
            thisFormField.dataEntry.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapControl(_:)))
            thisFormField.dataEntry.tapGestureRecognizer?.numberOfTapsRequired = 1
            thisImageView.isUserInteractionEnabled = true
            thisImageView.addGestureRecognizer(thisFormField.dataEntry.tapGestureRecognizer!)
            thisImageView.tag = thisFormField.dataEntry.fieldTag!

            // LABEL DO CAMPO
            let thisLabel = UILabel(frame: CGRect(x: CGFloat(20), y: CGFloat(0), width: cell.frame.width - 20, height: cell.frame.height))
            thisLabel.textAlignment = .left
            thisLabel.textColor = UIColor.lightGray
            thisLabel.font = UIFont(name: "DINPro-Regular", size: 16)
            thisLabel.text = thisFormField.message

            cell.addSubview(thisImageView)
            cell.addSubview(thisLabel)
            
        case 5: // botão de enviar
            // IMAGEM DO BOTÃO
            let thisImageView = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
            
            thisImageView.contentMode = .center
            thisImageView.image = #imageLiteral(resourceName: "Botão Normal")
            
            // associa um tapgesture ao objeto thisImageView para capturar o tap
            thisFormField.dataEntry.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapControl(_:)))
            thisFormField.dataEntry.tapGestureRecognizer?.numberOfTapsRequired = 1
            thisImageView.isUserInteractionEnabled = true
            thisImageView.addGestureRecognizer(thisFormField.dataEntry.tapGestureRecognizer!)
            thisImageView.tag = thisFormField.dataEntry.fieldTag!
            
            // LABEL DO BOTÃO
            let thisLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
            thisLabel.textAlignment = .center
            thisLabel.textColor = UIColor.white
            thisLabel.backgroundColor = UIColor.clear
            thisLabel.font = UIFont(name: "DINPro-Regular", size: 16)
            thisLabel.text = thisFormField.message
            
            cell.addSubview(thisImageView)
            cell.addSubview(thisLabel)
        default:
            _ = 0
        }
        
        return cell
    }
    
    //
    // MARK: - FORM FIELDS FETCH
    //
    
    // carrega o JSON do form
    func fetchFormFields( forURL: String, completionHandler: @escaping (Bool, String) -> Void)
    {
        let localFormAPI = FormAPI()
        
        formFields.ElementosForm.removeAll()
        tableView.reloadData()
        
        // mostra mensagem solicitando espera
        SVProgressHUD.show(withStatus: "Carregando dados. Aguarde.")

        localFormAPI.fetchFormData(URL: forURL) { (resultado, mensagem, formFields) in
            // oculta mensagem de espera
            SVProgressHUD.dismiss()

            if resultado
            {
                self.formFields = formFields!
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else
            {
                completionHandler(false, mensagem!)
            }
        }
    }
    
    //
    // MARK: - EVENTOS DA UI
    //
    
    // oculta teclado após data entry
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    // quando termina a entrada de dados no textField
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        // lógica para carregar os campos UITextField nos seus devidos lugares no array
        for(key, _) in formFields.ElementosForm.enumerated()
        {
            // se encontrou o objeto com a mesma tag do textField
            if textField.tag == formFields.ElementosForm[key].dataEntry.fieldTag
            {
                if formFields.ElementosForm[key].type == 1 // campo para data entry
                {
                    formFields.ElementosForm[key].dataEntry.stringData = textField.text!
                }
            }
        }
    }
    
    // quando o usuário está digitando os dados no textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        var returnValue = true
        
        // se o textField em questão é para input de endereço de email, valida o endereço
        if textField.keyboardType == .emailAddress
        {
            returnValue = generalFunctions.handleEmailField(text: textField.text!, withRange: range, withReplacementString: string)
        }
        
        // se o textField em questão é para input numérico
        if textField.keyboardType == .numberPad
        {
            // valida se o campo é do tipo telefone
            // procura pelo objeto com a tag
            for(key, _) in formFields.ElementosForm.enumerated()
            {
                // se encontrou o objeto com a mesma tag do textField
                if textField.tag == formFields.ElementosForm[key].dataEntry.fieldTag
                {
                    // se encontrou o campo de data entry e o campo é do tipo número de telefone
                    if formFields.ElementosForm[key].type == 1 && formFields.ElementosForm[key].typeField == 2
                    {
                        guard let text = textField.text as NSString? else { return true }
                        let newText = text.replacingCharacters(in: range, with: string)
                        
                        let maskTextField = textField as! JMMaskTextField
                        guard let unmaskedText = maskTextField.stringMask?.unmask(string: newText) else { return true }
                        
                        if unmaskedText.characters.count >= 11 {
                            maskTextField.maskString = "(00) 0 0000-0000"
                        } else {
                            maskTextField.maskString = "(00) 0000-0000"
                        }
                    }
                }
            }
        }
        
        return returnValue
    }

    // validação de tap sobre objeto da tableview
    func tapControl(_ sender: UITapGestureRecognizer)
    {
        let senderViewTag = sender.view?.tag
        
        // oculta o teclado
        dismissKeyboard()
        
        // procura pelo objeto com a tag
        for(key, _) in formFields.ElementosForm.enumerated()
        {
            // se encontrou o objeto com a tag
            if senderViewTag == formFields.ElementosForm[key].dataEntry.fieldTag
            {
                // testa o tipo do campo
                switch formFields.ElementosForm[key].type
                {
                case 4: // checkbox
                    if let thisImageView = sender.view as? UIImageView
                    {
                        // inverte o estado do campo no array
                        formFields.ElementosForm[key].dataEntry.booleanData = !formFields.ElementosForm[key].dataEntry.booleanData
                        
                        // ajusta a imagem de acordo
                        if formFields.ElementosForm[key].dataEntry.booleanData
                        {
                            thisImageView.image = #imageLiteral(resourceName: "Retangulo On")
                        }
                        else
                        {
                            thisImageView.image = #imageLiteral(resourceName: "Retangulo Off")
                        }
                    }
                case 5: // botão enviar
                    // validação dos campos
                    for(key, _) in formFields.ElementosForm.enumerated()
                    {
                        // se o campo é obrigatório
                        if formFields.ElementosForm[key].required!
                        {
                            // se o campo é do tipo data entry e está vazio
                            if formFields.ElementosForm[key].type == 1 && (formFields.ElementosForm[key].dataEntry.stringData == "" || formFields.ElementosForm[key].dataEntry.stringData == nil)
                            {
                                showAlert(title: "Aviso", body: "Faltou preencher \(formFields.ElementosForm[key].message!)", buttonText: "OK")
                                return
                            }
                        }
                        
                        // se o campo é email, valida o endereço
                        if formFields.ElementosForm[key].typeField == 3 && !generalFunctions.isValidEmail(emailAddress: formFields.ElementosForm[key].dataEntry.stringData!)
                        {
                            showAlert(title: "Aviso", body: "Endereço de email não é válido. Verifique.", buttonText: "OK")
                            return
                        }
                        
                        // se o campo é telefone, valida se foi corretamente preenchido
                        if formFields.ElementosForm[key].typeField == 2 && formFields.ElementosForm[key].dataEntry.stringData!.count < 14
                        {
                            showAlert(title: "Aviso", body: "Número de telefone não é válido. Verifique.", buttonText: "OK")
                            return
                        }
                        
                    }
                    
                    // notifica o MainViewController para apresentar a ConfirmationScreenViewController
                    NotificationCenter.default.post(name: Notification.Name(rawValue: localNotificationKey001), object: self, userInfo: nil)

                default:
                    _ = 0
                }
            }
        }
    }
}


