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
    
    var name = ""
    var email = ""
    var phone = ""
    
    var isChecked = false
    var hideCell: Bool?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

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
    func registerCell()
    {
        self.tableView.register(UINib(nibName: "IntroduceTableViewCell", bundle: nil), forCellReuseIdentifier: "introduceCell")
        self.tableView.register(UINib(nibName: "FieldsTableViewCell", bundle: nil), forCellReuseIdentifier: "fieldsCell")
        self.tableView.register(UINib(nibName: "ChangeRegisterTableViewCell", bundle: nil), forCellReuseIdentifier: "checkCell")
        self.tableView.register(UINib(nibName: "SendTableViewCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
    }
    
    @objc func sendContact()
    {
        if let name = UserDefaults.standard.string(forKey: "Name"), let phone = UserDefaults.standard.string(forKey: "Phone")
        {
            print("Name", name)
            print("Phone", phone)
            print(hideCell!)
            if hideCell!
            {
                if phone.count > 13
                {
                    self.performSegue(withIdentifier: "segueSuccess", sender: nil)
                }
                else
                {
                    print("Verificar número de telefone")
                }
            }
            else
            {
                if let email = UserDefaults.standard.string(forKey: "Email")
                {
                    if isValid(email) && phone.count > 13
                    {
                        self.performSegue(withIdentifier: "segueSuccess", sender: nil)
                    }
                    else
                    {
                        if isValid(email) == false
                        {
                            print("favor verificar email")
                        }
                        
                        if phone.count < 13
                        {
                            print("Verificar telefone")
                        }
                    }
                }
            }
        }
        else
        {
            print("Favor preencher todos os campos")
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
            case .introduce?:
                let introduceCell = tableView.dequeueReusableCell(withIdentifier: "introduceCell", for: indexPath) as! IntroduceTableViewCell
                
                introduceCell.topConstraint.constant = CGFloat(cell.topSpacing)
                introduceCell.labelIndroduce.text = cell.message
                
                return introduceCell
            case .fields?:
                let fieldsCell = tableView.dequeueReusableCell(withIdentifier: "fieldsCell", for: indexPath) as! FieldsTableViewCell
                
                fieldsCell.idCell = FieldsTableViewCell.LabelType(rawValue: cell.id)
                
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
                
                if self.isChecked == false
                {
                    self.hideCell = cell.hidden
                }
               
                if fieldsCell.idCell!.rawValue == 4
                {
                    if self.hideCell!
                    {
                        fieldsCell.heigthContraint.constant = 0
                        fieldsCell.topConstraint.constant = 0
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
        self.arrayCell = array
        self.tableView.reloadData()
    }
    
}

//MARK: - BEMCheckBoxDelegate
extension  ContactViewController: BEMCheckBoxDelegate
{
    func didTap(_ checkBox: BEMCheckBox)
    {
        self.isChecked = true
        if checkBox.on
        {
            print("Selecionou para cadastrar email")
            self.hideCell = false
            UIView.animate(withDuration: 0.0) {
                self.tableView.reloadData()
                print("Viewzinha")
                self.view.layoutIfNeeded()
            }
        }
        else
        {
            print("Não selecionou para cadastrar email")
            self.hideCell = true
            UIView.animate(withDuration: 0.0) {
                self.tableView.reloadData()
                print("Viewzinha2")
                self.view.layoutIfNeeded()
            }
        }
    }
}

