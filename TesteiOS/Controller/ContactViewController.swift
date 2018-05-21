//
//  ContactViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 18/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController
{
    enum CellType: Int
    {
        case introduce = 2
        case fields = 1
        case checkBox = 4
        case button = 5
    }
    
    enum TypeField
    {
        case text(Int)
        case tellNumber(String)
        case email(Int)
    }
    
    //Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //Properties
    var arrayCell: [Cell] = []
    var idCell: Int?
    
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
                
                fieldsCell.topConstraint.constant = CGFloat(cell.topSpacing)
                fieldsCell.labelFieldName.text = cell.message
                
                return fieldsCell
            case .checkBox?:
                let cellCheckBox = tableView.dequeueReusableCell(withIdentifier: "checkCell", for: indexPath) as! ChangeRegisterTableViewCell
                
                cellCheckBox.topConstraint.constant = CGFloat(cell.topSpacing)
                
                return cellCheckBox
            case .button?:
                let buttonCell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! SendTableViewCell
                
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
