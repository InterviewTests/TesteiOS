//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import UIKit

enum Type: Int, Codable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

class ContactViewController: BaseViewController {
    
    let superLightGray = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)
    let tagViewTextField = 999
    let scrollView = UIScrollView()
    var showFieldEmail = false
    var formattingPatternTellPhone = "(##) ####-####"
    var formattingPatternCellPhone = "(##) #####-####"
    var cells:[Cell] = []
    
    lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        toolbar.tintColor = .red
        let btCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(done))
        let btSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let btDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(cancel))
    
        toolbar.items = [btCancel, btSpace, btDone]
        return toolbar
    }()
    
    @objc func done() {
        view.endEditing(true)
    }
    
    @objc func cancel() {
        view.endEditing(true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        RestAPI.fetchGenericObject(endPoint: "cells.json", onComplete: { (response: CellResponse) in
            
            DispatchQueue.main.async {
                
                self.buildLayout(response.cells)
            }
            
        }) { (apiError) in
            
             self.showAlert(title: "Atenção", message: self.getFormatedError(apiError))
        }
    }
    
    func buildLayout(_ cells:[Cell]) {
        self.cells = cells

        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let lbTitle = UILabel()
        scrollView.addSubview(lbTitle)
        lbTitle.font = font
        lbTitle.textAlignment = .center
        lbTitle.text = "Contato"
        lbTitle.numberOfLines = 0
        lbTitle.lineBreakMode = .byWordWrapping
        lbTitle.translatesAutoresizingMaskIntoConstraints = false
        lbTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        lbTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        lbTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        lbTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        for cell in cells {
            
            switch cell.type {
                
            case .field:
                
                
                let stackView = UIStackView()
                scrollView.addSubview(stackView)
                stackView.tag = cell.id
                stackView.isHidden = cell.hidden
                showFieldEmail = cell.hidden
                stackView.axis = .vertical
                stackView.alignment = .leading
                stackView.distribution = .fillProportionally
                
                let textField = UITextField()
                stackView.addArrangedSubview(textField)
                textField.tag = cell.id + tagViewTextField
                textField.placeholder = cell.message
                textField.font = font
                textField.clearButtonMode = .whileEditing
                textField.returnKeyType = .done
                textField.delegate = self
                switch cell.typefield!.val() {
                    
                case "1":
                    textField.keyboardType = .default
                case "telnumber":
                    textField.keyboardType = .phonePad
                case "3":
                    textField.keyboardType = .emailAddress
                default:
                    textField.keyboardType = .default
                    
                }
                textField.addTarget(self, action: #selector(textFieldEditingPhone), for: .editingChanged)
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
                textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
                textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
                textField.inputAccessoryView = toolbar

                let viewBottom = UIView()
                stackView.addArrangedSubview(viewBottom)
                viewBottom.tag = textField.tag + 1 // o id da view e adicionado 1 para poder fazer o efeito da validacao no metodo validateFileds
                viewBottom.backgroundColor = superLightGray
                viewBottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
                viewBottom.translatesAutoresizingMaskIntoConstraints = false
                viewBottom.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
                viewBottom.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
                
                stackView.translatesAutoresizingMaskIntoConstraints = false
                stackView.topAnchor.constraint(equalTo: scrollView.subviews[scrollView.subviews.count - 2].bottomAnchor,  constant: CGFloat(cell.topSpacing)).isActive = true
                stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
                stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
                
                
            case .text:
            
                let label = UILabel()
                label.tag = cell.id
                scrollView.addSubview(label)
                label.text = cell.message
                label.numberOfLines = 0
                label.lineBreakMode = .byWordWrapping
                label.font = font
                label.isHidden = cell.hidden
                label.translatesAutoresizingMaskIntoConstraints = false
                label.topAnchor.constraint(equalTo: scrollView.subviews[scrollView.subviews.count - 2].bottomAnchor,  constant: CGFloat(cell.topSpacing)).isActive = true
                label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
                label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true

                
            case .image:
                
                let _ = UIImageView()
                
            case .checkbox:
                
                let checkbox = UIButton()
                checkbox.tag = cell.show ?? 0 //checkbox ira enviar o id da view que deve mostrar
                scrollView.addSubview(checkbox)
                checkbox.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
                checkbox.setTitle("  "+cell.message, for: .normal)
                checkbox.setTitleColor(.gray, for: .normal)
                checkbox.titleLabel?.font = font
                checkbox.imageView?.contentMode = .scaleAspectFit
                checkbox.translatesAutoresizingMaskIntoConstraints = false
                checkbox.addTarget(self, action: #selector(showHideEmail), for: .touchUpInside)
                checkbox.translatesAutoresizingMaskIntoConstraints = false
                checkbox.contentHorizontalAlignment = .left
                checkbox.topAnchor.constraint(equalTo: scrollView.subviews[scrollView.subviews.count - 2].bottomAnchor,  constant: CGFloat(cell.topSpacing)).isActive = true
                checkbox.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
                checkbox.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
                
            case .send:
                
                let button = UIButton()
                button.tag = cell.id
                scrollView.addSubview(button)
                button.setTitle("Enviar", for: .normal)
                button.backgroundColor = .red
                button.translatesAutoresizingMaskIntoConstraints = false
                button.layer.cornerRadius = 20
                button.clipsToBounds = true
                button.titleLabel?.font = font
                button.addTarget(self, action: #selector(enviar), for: .touchUpInside)
                button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
                button.topAnchor.constraint(equalTo: scrollView.subviews[scrollView.subviews.count - 2].bottomAnchor,  constant: CGFloat(cell.topSpacing)).isActive = true
                button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
                button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
                button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
            }
        }
    }
    
    @objc func showHideEmail(_ sender:UIButton) {
        
        showFieldEmail = !showFieldEmail
        sender.setImage(showFieldEmail ? #imageLiteral(resourceName: "check") : #imageLiteral(resourceName: "uncheck"), for: .normal)
        
        guard let stackEmail = scrollView.viewWithTag(sender.tag) as? UIStackView else { return }
        stackEmail.isHidden = !showFieldEmail
        
        if stackEmail.isHidden {
            
            guard let textField = stackEmail.arrangedSubviews.first as? UITextField else { return }
            textField.text = ""
            
            stackEmail.arrangedSubviews[1].backgroundColor = superLightGray // ao mostrar email novamente reseta a cor
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func textFieldEditingPhone(_ textField:UITextField) {
        
        if textField.keyboardType == .phonePad {
            
            let replacementChar: String = "#"
            let text = textField.text!
            
            if let char = text.last {
                
                formattingPatternTellPhone = formattingPatternTellPhone.stringByReplacingFirstOccurrenceOfString(target: replacementChar, withString: String(char))
                formattingPatternCellPhone = formattingPatternCellPhone.stringByReplacingFirstOccurrenceOfString(target: replacementChar, withString: String(char))
                
                var txTell = formattingPatternTellPhone.replacingOccurrences(of: "#", with: "")
                if textField.text!.count < 10 {
                    txTell = txTell.replacingOccurrences(of: "-", with: "")
                }
                
                var txCell = formattingPatternCellPhone.replacingOccurrences(of: "#", with: "")
                if textField.text!.count < 10 {
                    txCell = txCell.replacingOccurrences(of: "-", with: "")
                }
                
                textField.text = textField.text!.count == 14 ? txTell : txCell
            }
        }
        
    
        let _ = validateFileds(textField)
    }
    
    func validateFileds(_ textField:UITextField) -> Bool {
        
        var valid:Bool = false
        
        if textField.keyboardType == .phonePad {
            
            let regex = "[0-9]{10,11}"
            let matchPhone = NSPredicate(format: "SELF MATCHES %@", regex)
            let formatedText = textField.text!.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")
            
             valid = matchPhone.evaluate(with: formatedText)
            
        } else if textField.keyboardType == .emailAddress {
            
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let matchEmail = NSPredicate(format:"SELF MATCHES %@", regex)
            valid = matchEmail.evaluate(with: textField.text!)
            
            if !showFieldEmail {
                valid = true
            }
    
        } else if textField.keyboardType == .default {
            
            valid = textField.text!.count > 0
        }
        
        let view = scrollView.viewWithTag(textField.tag + 1)
        view?.backgroundColor = valid ? .green : .red
        
        return valid
    }
    
    @objc func enviar(_ sender:UIButton) {
        
        if sender.titleLabel?.text! == "Enviar" {
            
            var values:[[String:Any]] = [[:]]
            
            for cell in cells {
                
                if cell.required && cell.type == .field {
                    
                    guard let textField = scrollView.viewWithTag(cell.id + tagViewTextField) as? UITextField else { return }
                    
                    if !validateFileds(textField) {
                        showAlert(title: "Ops..", message: "O valor informado no campo \(cell.message) é inválido")
                        return
                    }
                    
                    values.append([
                        
                        "id": cell.id,
                        "value": textField.text!
                    ])
                }
            }
            
            do {
                
                let _ = try JSONSerialization.data(withJSONObject: values, options: .prettyPrinted)
                
                
                let sendData = true
                
                if sendData {
                    
                    self.clearFields(cells)
                    
                    let vc = storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as! SuccessViewController
                    self.addChildViewController(vc)
                    vc.view.frame = self.view.frame
                    self.view.addSubview(vc.view)
                    vc.didMove(toParentViewController: self)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func clearFields(_ cells:[Cell]) {
        
        for cell in cells {
            
            if cell.required && cell.type == .field {
                
                guard let textField = scrollView.viewWithTag(cell.id + tagViewTextField) as? UITextField else { return }
                textField.text = ""
                
                let view = scrollView.viewWithTag(textField.tag + 1)
                view?.backgroundColor = superLightGray
            }
        }
    }
}

extension String {
    func stringByReplacingFirstOccurrenceOfString(target: String, withString replaceString: String) -> String {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
}

extension ContactViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        if textField.keyboardType == .phonePad {
            
            formattingPatternTellPhone = "(##) ####-####"
            formattingPatternCellPhone = "(##) #####-####"
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.keyboardType == .phonePad {
            
            if textField.text?.count == 15 {
                return false
            }
        }
        
        return true
    }
}




