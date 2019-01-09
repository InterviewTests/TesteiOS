//
//  ContactView.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

protocol ContactViewDelegate:NSObjectProtocol{
    
    /// Notifies to update the datasource of [FormItem]
    func updateTableViewItems(items:[FormItem])
    
    /// Notifies toDisplays the success page
    func showSuccessPage()
    
    /// Notifies to Hides the success page
    func hideSuccessPage()
    
    /// Notifies to display a title and a message
    func displayPopup(title:String, message:String)
}

class ContactView: UIView {

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
        label.numberOfLines = 0
        label.textAlignment = .center
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
        button.setTitleColor(.red, for: .normal)
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
            staticLabel1.bottomAnchor.constraint(equalTo: staticLabel2.topAnchor, constant: -14),
            
            staticLabel2.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            staticLabel2.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            buttonNewMessage.widthAnchor.constraint(equalToConstant: 200),
            buttonNewMessage.heightAnchor.constraint(equalToConstant: 45),
            buttonNewMessage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonNewMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
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
