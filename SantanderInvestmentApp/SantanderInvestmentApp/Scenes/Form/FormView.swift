//
//  FormView.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
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
            make.top.equalTo(32)
            make.left.equalTo(16)
            make.bottom.right.equalTo(-16)
            make.centerX.equalTo(self)
        })
    }
}

