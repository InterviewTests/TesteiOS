//
//  ContactView.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

protocol ContactViewDelegate {
    func updateContactName(name:String?)
    func updateContactEmail(email:String?)
    func updateContactPhone(phone:String?)
    func userCheckedToReceiveEmail()
    func userUncheckedToReceiveEmail()
    func updateTableViewItems(items:[FormItem])
    func showSuccessPage()
    func hideSuccessPage()
}

class ContactView: UIView {
    
    var formItems:[FormItem] = []
    
    /// The list of items for the form
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle  = .none
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.registerCell(UILabelCell.self)
        tableView.registerCell(UIButtonCell.self)
        tableView.registerCell(UICheckBoxCell.self)
        tableView.registerCell(UITextFieldCell.self)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    /// The UIlabel with the text "Obrigado"
    private let staticLabel1:UILabel = {
        let label = UILabel()
        label.text = "Obrigado"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// The UIlabel with the text "Mensagem enviada com sucesso :)"
    private let staticLabel2:UILabel = {
        let label = UILabel()
        label.text = "Mensagem enviada\ncom sucesso :)"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// The button to send another message
    let buttonNewMessage:UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Enviar nova mensagem", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// Sets up the constraints for the views
    private func setupConstraints(){
        
        self.addSubview(buttonNewMessage)
        self.addSubview(staticLabel1)
        self.addSubview(staticLabel2)
        self.addSubview(tableView)
        
        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            tableView.topAnchor     .constraint(equalTo: self.topAnchor, constant:30),
            tableView.bottomAnchor  .constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor .constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            staticLabel1.centerXAnchor.constraint(equalTo: staticLabel2.centerXAnchor),
            staticLabel1.bottomAnchor.constraint(equalTo: staticLabel2.topAnchor, constant: 14),
            
            staticLabel2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            staticLabel2.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            buttonNewMessage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonNewMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContactView: ContactViewDelegate{
    
    func userCheckedToReceiveEmail() {
        
    }
    
    func userUncheckedToReceiveEmail() {
        
    }
    
    func updateTableViewItems(items: [FormItem]) {
        formItems = items
        tableView.reloadData()
    }
    
    func showSuccessPage() {
        
    }
    
    func hideSuccessPage() {
        
    }
    
    func updateContactName(name: String?) {
        
    }
    
    func updateContactEmail(email: String?) {
        
    }
    
    func updateContactPhone(phone: String?) {
        
    }
}
