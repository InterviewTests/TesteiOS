//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 18/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit
import BEMCheckBox

class ContactViewController: UIViewController
{
    
    enum CellType: Int
    {
        case introduce = 2
        case fields = 1
        case checkBox = 4
        case button = 5
    }
    
    enum TypeField: Int
    {
        case text = 1
        case tellNumber = 2
        case email = 3
    }
    
    //Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //Properties
    var arrayCell: [Cell] = []
    
    var isChecked = false
    var hideCell: Bool?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        ActivityIndicator.startActivity()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        registerCell()
        CellRequest.shared.request()
        CellRequest.shared.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    
    //MARK: - Methods
    //Register Xib
    func registerCell()
    {
        self.tableView.register(UINib(nibName: "IntroduceTableViewCell", bundle: nil), forCellReuseIdentifier: "introduceCell")
        self.tableView.register(UINib(nibName: "FieldsTableViewCell", bundle: nil), forCellReuseIdentifier: "fieldsCell")
        self.tableView.register(UINib(nibName: "ChangeRegisterTableViewCell", bundle: nil), forCellReuseIdentifier: "checkCell")
        self.tableView.register(UINib(nibName: "SendTableViewCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
    }
    
    //Action Button Send
    @objc func sendContact()
    {
        self.view.endEditing(true)
        
        // if name can get a key value                              // if phone can get a key value
        if let name = UserDefaults.standard.string(forKey: "Name"), let phone = UserDefaults.standard.string(forKey: "Phone")
        {
            print("Name", name)
            print("Phone", phone)
            
            //If cell not visible
            if self.hideCell == false
            {
                // if email can get a key value
                if let email = UserDefaults.standard.string(forKey: "Email")
                {
                    //If email is valid and phone has more than 13 characters
                    if isValid(email) && phone.count > 13
                    {
                        self.performSegue(withIdentifier: "segueSuccess", sender: nil)
                    }
                    else
                    {
                        if isValid(email) == false
                        {
                            self.present(Alert.generateAlert(withTitle: "Email inválido", message: "Favor verificar email"), animated: true, completion: nil)
                        }
                        
                        if phone.count < 13
                        {
                            self.present(Alert.generateAlert(withTitle: "Atenção", message: "Verificar número de telefone"), animated: true, completion: nil)
                        }
                    }
                }
                else
                {
                    self.present(Alert.generateAlert(withTitle: "Campo em branco", message: "Favor preencher o campo email"), animated: true, completion: nil)
                }
            }
            else
            {
                self.present(Alert.generateAlert(withTitle: "Não foi possível finalizar", message: "Para entrarmos em contato, é necessário cadastrar o email"), animated: true, completion: nil)
            }
        }
        else
        {
             self.present(Alert.generateAlert(withTitle: "Campo vazio", message: "Favor preencher todos os campos"), animated: true, completion: nil)
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension ContactViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrayCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.arrayCell[indexPath.row]
        
        switch CellType(rawValue: cell.type)
        {
            //Create cell according your type
            case .introduce?:
                let introduceCell = tableView.dequeueReusableCell(withIdentifier: "introduceCell", for: indexPath) as! IntroduceTableViewCell
                
                introduceCell.topConstraint.constant = CGFloat(cell.topSpacing)
                introduceCell.labelIndroduce.text = cell.message
                
                return introduceCell
            case .fields?:
                let fieldsCell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell", for: indexPath) as! FieldsTableViewCell
                
                fieldsCell.idCell = FieldsTableViewCell.LabelType(rawValue: cell.id)
                
                //Set type of keyboard according to cell type
                switch TypeField(rawValue: cell.typefield)
                {
                    case .text?:
                        fieldsCell.textFields.keyboardType = .default
                    case .email?:
                        fieldsCell.textFields.keyboardType = .emailAddress
                    case .tellNumber?:
                        fieldsCell.textFields.keyboardType = .numberPad
                    case .none:
                        break
                }
               
                //If cell id equal 4
                if fieldsCell.idCell!.rawValue == 4
                {
    
                    if self.isChecked == false
                    {
                        self.hideCell = cell.hidden
                    }
                    
                    print(self.hideCell!)
                    //if the cell is not visible
                    if self.hideCell!
                    {
                        fieldsCell.heigthContraint.constant = 0 //Setting heigth value
                        fieldsCell.topConstraint.constant = 0 //Setting topConstraint value
                        print("0=====>",fieldsCell.topConstraint.constant)
                    }
                    else
                    {
                        fieldsCell.heigthContraint.constant = 51
                        fieldsCell.topConstraint.constant = CGFloat(cell.topSpacing)
                        print("35=====>",fieldsCell.topConstraint.constant)
                    }
                }
               
                fieldsCell.topConstraint.constant = CGFloat(cell.topSpacing)
                fieldsCell.labelTitle.text = cell.message
                fieldsCell.idCell = FieldsTableViewCell.LabelType(rawValue: cell.id)
                
                return fieldsCell
            case .checkBox?:
                let cellCheckBox = tableView.dequeueReusableCell(withIdentifier: "checkCell", for: indexPath) as! ChangeRegisterTableViewCell
                
                cellCheckBox.checkBox.delegate = self
                cellCheckBox.topConstraint.constant = CGFloat(cell.topSpacing)
                
                return cellCheckBox
            case .button?:
                let buttonCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! SendTableViewCell
                
                buttonCell.buttonSend.setTitle(cell.message, for: .normal)
                buttonCell.buttonSend.addTarget(self, action: #selector(sendContact), for: .touchUpInside)
                
                buttonCell.topConstraint.constant = CGFloat(cell.topSpacing)
                
                return buttonCell
            case .none:
                let cell = UITableViewCell()
                
                return cell
        }
    }
}

//MARK: CellRequestDelegate
extension ContactViewController: CellRequestDelegate
{
    func getValuesOfCell(withArrayValues array: [Cell])
    {
        print("CellRequestDelegate")
        self.arrayCell = array //Assigning cell.json file value to array
        self.tableView.reloadData() // Reload tableView
        ActivityIndicator.stopActivity()
    }
    
}

//MARK: - BEMCheckBoxDelegate
extension  ContactViewController: BEMCheckBoxDelegate
{
    func didTap(_ checkBox: BEMCheckBox)
    {
        // When checkbox is touched the first time, the variable receives the true value
        self.isChecked = true
        if checkBox.on//If User wish register email
        {
            print("Selecionou para cadastrar email")
            self.hideCell = false
            UIView.animate(withDuration: 0.5) {
                self.tableView.reloadData()
                print("Viewzinha")
                self.view.layoutIfNeeded()
            }
        }
        else
        {
            print("Não selecionou para cadastrar email")
            self.hideCell = true
            UIView.animate(withDuration: 0.5) {
                self.tableView.reloadData()
                print("Viewzinha2")
                self.view.layoutIfNeeded()
            }
        }
    }
}
