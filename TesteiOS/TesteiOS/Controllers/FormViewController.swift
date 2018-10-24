//
//  FormViewController.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit
import SVProgressHUD
import JMMaskTextField_Swift

class FormViewController: UIViewController, UITextFieldDelegate {

    //
    // MARK: - SETUP DE VARIÁVEIS LOCAIS
    //
    var formFields: FormModel?
    var URL_Form_Contato = String()
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
        
        // carrega o JSON de formulário
        fetchFormFields(forURL: URL_Form_Contato, completionHandler: { (resultado, mensagem) in
            if !resultado
            {
                DispatchQueue.main.async {
                    self.showAlert(title: Constants.Form.View.errorTitle, body: Constants.Form.View.errorMessage, buttonText: Constants.Form.View.okButton)
                }
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // MARK: - FORM FIELDS FETCH
    //
    
    // carrega o JSON do form
    func fetchFormFields( forURL: String, completionHandler: @escaping (Bool, String) -> Void){
        let localFormAPI = FormAPI()
        
        tableView.reloadData()
        
        // mostra mensagem solicitando espera
        SVProgressHUD.show(withStatus: Constants.loadingMessage)
        
        localFormAPI.fetchFormData(URL: forURL, completionHandler: { (formFields) in
            SVProgressHUD.dismiss()
            self.formFields = formFields!

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

        }) { (erroMessage) in
            SVProgressHUD.dismiss()
            completionHandler(false, erroMessage!)
        }
    }
    
    //
    // MARK: - EVENTOS DA UI
    //
    
    // oculta teclado após data entry
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    // ajusta o indicador de status do campo de acordo com a validação
    func setFieldValidationIndicator( cell: UITableViewCell, status: FieldValidationState ) -> Bool{
        for view in cell.subviews{
            if let imageView = view as? UIImageView{
                switch status{
                case .empty:
                    imageView.image = UIImage(named: Constants.Form.View.emtpyFieldIndicator)
                case .invalid:
                    imageView.image = UIImage(named: Constants.Form.View.invalidFieldIndicator)
                case .valid:
                    imageView.image = UIImage(named: Constants.Form.View.validFieldIndicator)
                }
                view.removeFromSuperview()
                cell.addSubview(imageView)
                return true
            }
        }
        return false
    }
    
    // quando termina a entrada de dados no textField
    func textFieldDidEndEditing(_ textField: UITextField){
        if var fields = formFields{
            // lógica para carregar os campos UITextField nos seus devidos lugares no array
            for(key, _) in fields.cells.enumerated() {
                // se encontrou o objeto com a mesma tag do textField
                if textField.tag == fields.cells[key].tag {
                    if fields.cells[key].type == 1 { // campo para data entry
                        formFields?.cells[key].stringData = textField.text!
                    }
                    
                    // se o campo é email, valida o endereço
                    if fields.cells[key].typefield == Typefield.init(value: 3) {
                        if !globalFunctions.isValidEmail(emailAddress: textField.text!){
                            formFields?.cells[key].state = FieldValidationState.invalid
                        } else {
                            formFields?.cells[key].state = FieldValidationState.valid
                        }
                    }
                    
                    // se o campo é telefone, valida o tamanho
                    if fields.cells[key].typefield == Typefield.init(string: "telnumber") {
                        if textField.text!.count < 14{
                            formFields?.cells[key].state = FieldValidationState.invalid
                        } else {
                            formFields?.cells[key].state = FieldValidationState.valid
                        }
                    }
                    
                    // se o campo está vazio
                    if textField.text! == ""{
                        formFields?.cells[key].state = FieldValidationState.empty
                    }

                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // quando o usuário está digitando os dados no textField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        var returnValue = true
        
        // se o textField em questão é para input de endereço de email, valida o endereço
        if textField.keyboardType == .emailAddress{
            returnValue = globalFunctions.handleEmailField(text: textField.text!, withRange: range, withReplacementString: string)
        }
        
        // se o textField em questão é para input numérico
        if textField.keyboardType == .numberPad{
            if var fields = formFields{
                // valida se o campo é do tipo telefone
                // procura pelo objeto com a tag
                for(key, _) in fields.cells.enumerated(){
                    // se encontrou o objeto com a mesma tag do textField
                    if textField.tag == fields.cells[key].tag{
                        // se encontrou o campo de data entry e o campo é do tipo número de telefone
                        if fields.cells[key].type == 1 && fields.cells[key].typefield == Typefield.init(string: "telnumber"){
                            guard let text = textField.text as NSString? else { return true }
                            let newText = text.replacingCharacters(in: range, with: string)
                            
                            let maskTextField = textField as! JMMaskTextField
                            guard let unmaskedText = maskTextField.stringMask?.unmask(string: newText) else { return true }
                            
                            if unmaskedText.characters.count >= 11 {
                                maskTextField.maskString = Constants.Form.View.cellPhoneMask
                            } else {
                                maskTextField.maskString = Constants.Form.View.landLinePhoneMask
                            }
                        }
                    }
                }
            }
        }
        
        return returnValue
    }

    // validação de tap sobre objeto da tableview
    @objc func tapControl(_ sender: UITapGestureRecognizer){
        let senderViewTag = sender.view?.tag
        
        // oculta o teclado
        dismissKeyboard()
        
        if var cells = formFields?.cells{
            // procura pelo objeto com a tag
            for(key, _) in cells.enumerated(){
                // se encontrou o objeto com a tag
                
                if senderViewTag == cells[key].tag{
                    // testa o tipo do campo
                    switch cells[key].type{
                    case 4: // checkbox
                        if let thisImageView = sender.view as? UIImageView{
                            // inverte o estado do campo no array
                            if let state = cells[key].booleanData{
                                formFields?.cells[key].booleanData = !state
                                // ajusta a imagem de acordo
                                if !state{
                                    thisImageView.image = #imageLiteral(resourceName: "Retangulo On")
                                }
                                else{
                                    thisImageView.image = #imageLiteral(resourceName: "Retangulo Off")
                                }
                            }
                            
                        }
                    case 5: // botão enviar
                        // validação dos campos
                        for(key, _) in cells.enumerated(){
                            // se o campo é obrigatório
                            if cells[key].required{
                                // se o campo é do tipo data entry e está vazio
                                if cells[key].type == 1 && (cells[key].stringData == "" || cells[key].stringData == nil){
                                    showAlert(title: Constants.Form.View.warning, body: "\(Constants.Form.View.missingData) \(cells[key].message)", buttonText: Constants.Form.View.okButton)
                                    return
                                }
                            }
                            
                            // se o campo é email, valida o endereço
                            if cells[key].typefield == Typefield.init(value: 3) && !globalFunctions.isValidEmail(emailAddress: cells[key].stringData!){
                                showAlert(title: Constants.Form.View.warning, body: Constants.Form.View.invalidEmailAddress, buttonText: Constants.Form.View.okButton)
                                return
                            }
                            
                            // se o campo é telefone, valida se foi corretamente preenchido
                            if cells[key].typefield == Typefield.init(string: "telnumber") && cells[key].stringData!.count < 14 {
                                showAlert(title: Constants.Form.View.warning, body: Constants.Form.View.invalidPhoneNumber, buttonText: Constants.Form.View.okButton)
                                return
                            }
                            
                        }
                        
                        // notifica o MainViewController para apresentar a ConfirmationScreenViewController
                        NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.localNotificationKey001), object: self, userInfo: nil)

                    default:
                        _ = 0
                    }
                }
            }
        }
    }
}

extension FormViewController: UITableViewDelegate, UITableViewDataSource{
    //
    // MARK: - TABLEVIEW DELEGATE FUNCTIONS
    //
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let form = formFields{
            return form.cells.count
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        if let thisFormField = formFields?.cells[row] {
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
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FormCell", for: indexPath) as UITableViewCell
        let row = indexPath.row
        
        if var thisFormField = formFields?.cells[row]{
            // remove todas as subviews e observers da célula
            for subView in cell.subviews{
                subView.removeFromSuperview()
            }
            
            // configura o conteúdo da cell de acordo com o tipo de campo do formulário
            switch thisFormField.type{
            case 1: // campo para data entry
                
                // LABEL DO CAMPO
                let thisLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
                thisLabel.textAlignment = .left
                thisLabel.textColor = UIColor.lightGray
                thisLabel.font = UIFont(name: Constants.Form.View.regularFont, size: 16)
                thisLabel.text = thisFormField.message
                
                // CAMPO PARA DATA ENTRY
                let thisTextField = JMMaskTextField(frame: CGRect(x: CGFloat(0), y: CGFloat(20), width: cell.frame.width, height: cell.frame.height))
                thisTextField.font = UIFont(name: Constants.Form.View.regularFont, size: 16)
                thisTextField.textColor = UIColor.black
                thisTextField.textAlignment = .left
                thisTextField.borderStyle = .none
                thisTextField.clearButtonMode = .whileEditing
                if let thisTag = thisFormField.tag{
                    thisTextField.tag = thisTag
                }
                if let theString = thisFormField.stringData{
                    thisTextField.text = theString
                }
                thisTextField.delegate = self
                
                // customiza máscara e tipo de teclado de acordo com o tipo de campo
                switch thisFormField.typefield{
                case .integer(1): // text
                    thisTextField.keyboardType = .asciiCapable
                case .string("telnumber"): // phone
                    thisTextField.maskString = Constants.Form.View.cellPhoneMask
                    thisTextField.keyboardType = .numberPad
                case .integer(3): // email
                    thisTextField.keyboardType = .emailAddress
                default:
                    thisTextField.keyboardType = .asciiCapable
                }
                
                // INDICADOR DE VALIDAÇÃO
                let thisImageView = UIImageView(frame: CGRect(x: CGFloat(0), y: cell.frame.height - 1, width: cell.frame.width, height: 1))
                thisImageView.contentMode = .scaleToFill
                thisImageView.image = UIImage(named: Constants.Form.View.emtpyFieldIndicator)
                
                if let thisState = thisFormField.state{
                    switch thisState{
                    case .valid:
                        thisImageView.image = UIImage(named: Constants.Form.View.validFieldIndicator)
                    case .invalid:
                        thisImageView.image = UIImage(named: Constants.Form.View.invalidFieldIndicator)
                    default:
                        _ = 0
                    }
                }
                
                cell.addSubview(thisLabel)
                cell.addSubview(thisTextField)
                cell.addSubview(thisImageView)
            case 2: // display de texto
                
                // LABEL DO CAMPO
                let thisLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
                thisLabel.textAlignment = .left
                thisLabel.textColor = UIColor.lightGray
                thisLabel.font = UIFont(name: Constants.Form.View.regularFont, size: 16)
                thisLabel.text = thisFormField.message
                if let thisTag = thisFormField.tag{
                    thisLabel.tag = thisTag
                }
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
                thisFormField.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapControl(_:)))
                thisFormField.tapGestureRecognizer?.numberOfTapsRequired = 1
                thisImageView.isUserInteractionEnabled = true
                thisImageView.addGestureRecognizer(thisFormField.tapGestureRecognizer!)
                if let thisTag = thisFormField.tag{
                    thisImageView.tag = thisTag
                }
                
                // LABEL DO CAMPO
                let thisLabel = UILabel(frame: CGRect(x: CGFloat(20), y: CGFloat(0), width: cell.frame.width - 20, height: cell.frame.height))
                thisLabel.textAlignment = .left
                thisLabel.textColor = UIColor.lightGray
                thisLabel.font = UIFont(name: Constants.Form.View.regularFont, size: 16)
                thisLabel.text = thisFormField.message
                
                cell.addSubview(thisImageView)
                cell.addSubview(thisLabel)
                
            case 5: // botão de enviar
                // IMAGEM DO BOTÃO
                let thisImageView = UIImageView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
                
                thisImageView.contentMode = .center
                thisImageView.image = #imageLiteral(resourceName: "Botão Normal")
                
                // associa um tapgesture ao objeto thisImageView para capturar o tap
                thisFormField.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapControl(_:)))
                thisFormField.tapGestureRecognizer?.numberOfTapsRequired = 1
                thisImageView.isUserInteractionEnabled = true
                thisImageView.addGestureRecognizer(thisFormField.tapGestureRecognizer!)
                if let thisTag = thisFormField.tag{
                    thisImageView.tag = thisTag
                }
                
                // LABEL DO BOTÃO
                let thisLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: cell.frame.width, height: cell.frame.height))
                thisLabel.textAlignment = .center
                thisLabel.textColor = UIColor.white
                thisLabel.backgroundColor = UIColor.clear
                thisLabel.font = UIFont(name: Constants.Form.View.regularFont, size: 16)
                thisLabel.text = thisFormField.message
                
                cell.addSubview(thisImageView)
                cell.addSubview(thisLabel)
            default:
                _ = 0
            }
        }
        
        return cell
    }
}
