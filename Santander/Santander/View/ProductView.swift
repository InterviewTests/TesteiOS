//
//  ProductView.swift
//  Santander
//
//  Created by Jonathan Martins on 04/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

protocol ProductViewDelegate:NSObjectProtocol {
    
    /// Notifies to update the datasource
    func updateTableViewItems()
    
    /// Notifies to open a webview with a given URL
    func openWebView(site:String)
    
    /// Notifies to display a title and a message
    func displayPopup(title:String, message:String)
}

class ProductView: UIView {
    
    /// The list to hold the information
    let tableView:UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle  = .none
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.isHidden = true
        tableView.registerCell(HeaderCell.self)
        tableView.registerCell(UIButtonCell.self)
        tableView.registerCell(DownloadCell.self)
        tableView.registerCell(MoreInfoDoubleCell.self)
        tableView.registerCell(MoreInfoSingleCell.self)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    /// Sets up the constraints for the views
    private func setupConstraints(){
        self.addSubview(tableView)
        
        self.backgroundColor = .white
        NSLayoutConstraint.activate([
            tableView.topAnchor     .constraint(equalTo: self.topAnchor, constant: 30),
            tableView.bottomAnchor  .constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor .constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
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
