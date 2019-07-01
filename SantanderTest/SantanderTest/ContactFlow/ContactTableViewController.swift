//
//  ContactTableViewController.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 30/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

extension ContactTableViewController: TextFieldCellDelegate
{
    func onEditing(text: String, type: CustomTypeField, id: Int)
    {
        tableView.scrollToRow(at: .init(row: 0, section: id), at: .bottom, animated: false)
        
        if type == .email
        {
            fields.email = text
        }
        else if type == .telNumber
        {
            fields.phone = text
        }
        else
        {
            fields.name = text
        }
    }
}

extension ContactTableViewController: CheckBoxCellDelegate
{
    func onAction(isChecked: Bool, componentId: UInt8?)
    {
        if let index = model?.cells?.firstIndex(where: { $0.id == componentId })
        {
            model?.cells?[index].hidden = !isChecked
            
            tableView.reloadData()
        }
    }
}

extension ContactTableViewController: ButtonCellDelegate
{
    func onAction()
    {
        let requiredFields = model?.cells?.filter({ (cell) -> Bool in
            
            if let isRequired = cell.required, let isHidden = cell.hidden, isRequired, !isHidden, cell.typefield != nil
            {
                return true
            }
            
            return false
        })
        
        if fields.name.isEmpty
        {
            if let index = model?.cells?.firstIndex(where: { (cell) -> Bool in
                
                if let typeField = cell.typefield, typeField == .text
                {
                    return true
                }
                
                return false
            })
            {
                if let cell = tableView.cellForRow(at: .init(row: 0, section: index)) as? TextFieldTableViewCell
                {
                    cell.applyStatus(status: .error)
                    
                    tableView.scrollToRow(at: .init(row: 0, section: index), at: .bottom, animated: true)
                }
            }
            
            return
        }
        
        // logica é a mesma
//        if !fields.email.isValidEmail
//        {
//            return
//        }
//
//        if !fields.phone.isValidPhone
//        {
//
//            return
//        }
        
        self.performSegue(withIdentifier: "ContactSegue", sender: nil)
        
//        fields = ("","","")
//        
//        model = originalModel
//
//        tableView.reloadData()
    }
}

class ContactTableViewController: UITableViewController
{
    @IBOutlet var tryAgainButton: UIButton!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    var fields: (name: String, email: String, phone: String) = ("","","")
    
    private var model: ContactScreen?
    {
        didSet
        {
            self.tableView.backgroundView = nil
        }
    }
    
    private var originalModel: ContactScreen?
    
    @IBAction func refreshAction()
    {
        Server_Request()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Remove linha navigationBar
        self.navigationController?.navigationBar.backIndicatorImage = .init()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = .init()
        
//        refreshAction()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)

        refreshAction()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return model?.cells?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if let component = model?.cells?[section], let height = component.topSpacing, let isHidden = component.hidden, !isHidden
        {
            return .init(height)
        }
        
        return .zero
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView: UIView = .init()
        headerView.backgroundColor = .clear
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if let component = model?.cells?[indexPath.section], let isHidden = component.hidden, isHidden
        {
            return .zero
        }
        
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let component = model?.cells?[indexPath.section], let type = component.type, let isHidden = component.hidden, !isHidden
        {
            if type == .text
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as? LabelTableViewCell else
                {
                    return .init()
                }
                
                cell.applyContent(text: component.message)
                
                return cell
            }
            
            if type == .field
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as? TextFieldTableViewCell, let typeField = component.typefield else
                {
                    return .init()
                }
                
                cell.delegate = self
                
                var text = ""
                
                if typeField == .email
                {
                    text = fields.email
                }
                else if typeField == .telNumber
                {
                    text = fields.phone
                }
                else
                {
                    text = fields.name
                }
                
                cell.applyContent(placeholder: component.message, text: text, type: component.typefield, id: indexPath.section)
                
                return cell
            }
            
            if type == .checkbox
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell", for: indexPath) as? CheckBoxTableViewCell else
                {
                    return .init()
                }
                
                cell.delegate = self
                cell.applyContent(text: component.message, id: component.show)
                
                return cell
            }
            
            if type == .send
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as? ButtonTableViewCell else
                {
                    return .init()
                }
                
                cell.delegate = self
                cell.applyContent(text: component.message)
                
                return cell
            }
            
            if type == .image
            {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageTableViewCell else
                {
                    return .init()
                }
                
                return cell
            }
        }
        
        return .init()
    }
    
    private func Server_Request()
    {
        fields = ("","","")
        
        model = nil
        
        tableView.reloadData()
        
        if #available(iOS 10.0, *)
        {
            if let refreshControl = tableView.refreshControl, !refreshControl.isRefreshing
            {
                tableView.backgroundView = indicatorView
            }
        }
        else
        {
            tableView.backgroundView = indicatorView
        }
        
        SantanderApiClient.request(operation: .contactForm) { (response: Result<ContactScreen,NSError>) in
            
            DispatchQueue.main.async {
                
                if #available(iOS 10.0, *)
                {
                    self.tableView.refreshControl?.endRefreshing()
                }
                
                switch response
                {
                    case .success(let result):
                        
                        self.originalModel = result
                        
                        self.model = result
                        
                        self.tableView.reloadData()
                    
                    case .failure(_):
                        
                        self.tableView.backgroundView = self.tryAgainButton
                    
                }
                
            }
            
        }
    }
}
