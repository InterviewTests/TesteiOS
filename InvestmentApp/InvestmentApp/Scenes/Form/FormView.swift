//
//  FormView.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit
import SnapKit

class FormView: UIView, ViewConfigurationProtocol {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.estimatedRowHeight = 56.0
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        
        addSubview(tableView)
    }
    
    func setupLayout() {
        tableView.snp.makeConstraints({ (make) in
            make.top.left.equalTo(16)
            make.bottom.right.equalTo(-16)
            make.centerX.equalTo(self)
        })
    }
}

